
import 'dart:convert';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:go_chat/API/ApiEvent.dart';
import 'package:go_chat/API/types/Channel.dart';
import 'package:go_chat/API/ChannelAddEvent.dart';
import 'package:go_chat/API/EventTypes.dart';
import 'package:go_chat/API/MessageAddEvent.dart';
import 'package:go_chat/API/types/ChatMessage.dart';
import 'package:go_chat/lib/CommonHelpers.dart';

@Injectable()
class ApiSocket {
  bool connected = false;
  WebSocket webSocket;
  Map<String, List<Function>> subscribers = Map<String, List<Function>>();

  ApiSocket() {
    webSocket = WebSocket('ws://localhost:3183');
    webSocket.onMessage.listen(this._onMessage);
    webSocket.onOpen.listen((event) => this.connected = true);
  }
  void send(ApiEvent message) async {
    while (!this.connected) {
      await CommonHelpers.pause(Duration(milliseconds: 10));
    }
    webSocket.send(json.encode(message));
  }

  void subscribe(String eventType, Function listener) {
    if (subscribers[eventType] == null) {
      subscribers[eventType] = List<Function>();
    }
    subscribers[eventType].add(listener);
  }

  void unsubscribe(String eventType) {
    subscribers[eventType] = List<Function>();
  }

  void _onMessage(MessageEvent message) {
    Map parsedJson = json.decode(message.data);
    if (parsedJson["Type"]== EventTypes.ChannelAdd) {
      List<Channel> channels = List<Channel>();
      List<Map<String, dynamic>> channelMaps = List.from(parsedJson["Data"]);
      channelMaps.forEach((channelMap) {
        channels.add(Channel(channelMap["Id"], channelMap["Name"]));
      });
      ChannelAddEvent apiEvent = ChannelAddEvent(channels);
      notifySubscribers(apiEvent);
    } else if (parsedJson["Type"]== EventTypes.MessageAdd) {
      List<ChatMessage> messages = List<ChatMessage>();
      List<Map<String, dynamic>> messageMaps = List.from(parsedJson["Data"]);
      messageMaps.forEach((messageMap) {
        messages.add(ChatMessage(messageMap["Id"], messageMap["Text"]));
      });
      MessageAddEvent apiEvent = MessageAddEvent(messages);
      notifySubscribers(apiEvent);
    }

  }
  void notifySubscribers(ApiEvent apiEvent) {
   subscribers[apiEvent.type].forEach((s) {
     s(apiEvent);
   });
  }
}
