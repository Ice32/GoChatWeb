import 'package:go_chat/API/ApiEvent.dart';
import 'package:go_chat/API/EventTypes.dart';

class MessageSubscribeMessage extends ApiEvent {
  MessageSubscribeMessage(String channelId): super(EventTypes.MessageSubscribe) {
    this.data = channelId;
  }
}
