import 'package:go_chat/API/ApiSocket.dart';
import 'package:go_chat/API/ChannelAddEvent.dart';
import 'package:go_chat/API/ChannelAddMessage.dart';
import 'package:go_chat/API/ChannelSubscribeMessage.dart';
import 'package:go_chat/API/EventTypes.dart';
import 'package:go_chat/API/MessageAddEvent.dart';
import 'package:go_chat/API/MessageAddMessage.dart';
import 'package:go_chat/API/MessageSubscribeMessage.dart';
import 'package:go_chat/API/MessageUnsubscribeMessage.dart';
import 'package:go_chat/API/types/NewChatMessage.dart';

class ChatService {
  ApiSocket _apiSocket;

  ChatService(this._apiSocket);

  void addMessage(NewChatMessage message) {
    _apiSocket.send(MessageAddMessage(message));
  }
  void listenForChannels(Function fn) {
    _apiSocket.subscribe(EventTypes.ChannelAdd, (ChannelAddEvent message) {
      fn(message.data);
    });
    _apiSocket.send(ChannelSubscribeMessage());
  }
  void listenForMessages(String channelId, Function fn) {
    _apiSocket.subscribe(EventTypes.MessageAdd, (MessageAddEvent message) {
      fn(message.data);
    });
    _apiSocket.send(MessageSubscribeMessage(channelId));
  }
  void stopListeningForMessages(String channelId) {
    _apiSocket.unsubscribe(EventTypes.MessageAdd);
    _apiSocket.send(MessageUnsubscribeMessage(channelId));
  }
  void listenForErrors(Function fn) {
    _apiSocket.subscribe(EventTypes.Error, (MessageAddEvent message) {
      fn(message.data);
    });
  }
  void addChannel(String channelName) {
    _apiSocket.send(ChannelAddMessage(channelName));
  }
}