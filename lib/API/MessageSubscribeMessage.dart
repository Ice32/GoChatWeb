import 'package:go_chat/API/ApiEvent.dart';
import 'package:go_chat/API/EventTypes.dart';

class MessageSubscribeMessage extends ApiEvent {
  MessageSubscribeMessage(): super(EventTypes.MessageSubscribe) {}
}
