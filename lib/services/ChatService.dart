import 'package:go_chat/API/ApiSocket.dart';
import 'package:go_chat/API/ChannelAddEvent.dart';
import 'package:go_chat/API/ChannelSubscribeMessage.dart';
import 'package:go_chat/API/EventTypes.dart';
import 'package:go_chat/API/MessageAddEvent.dart';
import 'package:go_chat/API/MessageAddMessage.dart';
import 'package:go_chat/API/MessageSubscribeMessage.dart';

class ChatService {
  ApiSocket _apiSocket;

  ChatService(this._apiSocket);

  void addMessage(String message) {
    _apiSocket.send(MessageAddMessage(message));
  }
  void listenForChannels(Function fn) {
    _apiSocket.subscribe(EventTypes.ChannelAdd, (ChannelAddEvent message) {
      fn(message.data);
    });
    _apiSocket.send(ChannelSubscribeMessage());
  }
  void listenForMessages(Function fn) {
    _apiSocket.subscribe(EventTypes.MessageAdd, (MessageAddEvent message) {
      fn(message.data);
    });
    _apiSocket.send(MessageSubscribeMessage());
  }
}