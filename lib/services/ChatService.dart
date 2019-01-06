import 'package:go_chat/API/ApiSocket.dart';
import 'package:go_chat/API/ChannelAddEvent.dart';
import 'package:go_chat/API/ChannelSubscribeMessage.dart';
import 'package:go_chat/API/EventTypes.dart';
import 'package:go_chat/API/MessageAddEvent.dart';

class ChatService {
  ApiSocket _apiSocket;

  ChatService(this._apiSocket);

  void addMessage(String message) {
    _apiSocket.send(MessageAddEvent(message));
  }
  void listenForChannels(Function fn) {
    _apiSocket.subscribe(EventTypes.ChannelAdd, (ChannelAddEvent message) {
      fn(message.data);
    });
    _apiSocket.send(ChannelSubscribeMessage());
  }
}