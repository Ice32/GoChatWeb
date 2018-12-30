
import 'dart:convert';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:go_chat/API/ApiEvent.dart';
import 'package:go_chat/API/ChannelAddEvent.dart';
import 'package:go_chat/API/EventTypes.dart';
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
  send(ApiEvent message) async {
    while (!this.connected) {
      await CommonHelpers.pause(Duration(milliseconds: 10));
    }
    webSocket.send(message);
  }

  subscribe(String eventType, Function listener) {
    if (subscribers[eventType] == null) {
      subscribers[eventType] = List<Function>();
    }
    subscribers[eventType].add(listener);
  }

  void _onMessage(MessageEvent message) {
    Map parsedJson = json.decode(message.data);
    if (parsedJson["Type"]== EventTypes.ChannelAdd) {
      List<String> channels = List.from(parsedJson["Data"]);
      ChannelAddEvent apiEvent = ChannelAddEvent(channels);
      notifySubscribers(apiEvent);
    }

  }
  void notifySubscribers(ApiEvent apiEvent) {
   subscribers[apiEvent.type].forEach((s) {
     s(apiEvent);
   });
  }
}
