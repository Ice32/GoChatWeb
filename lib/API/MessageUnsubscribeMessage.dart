import 'package:go_chat/API/ApiEvent.dart';
import 'package:go_chat/API/EventTypes.dart';

class MessageUnsubscribeMessage extends ApiEvent {
  MessageUnsubscribeMessage(String channelId): super(EventTypes.MessageUnsubscribe) {
    this.data = channelId;
  }
}
