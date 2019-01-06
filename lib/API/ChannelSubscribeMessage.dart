import 'package:go_chat/API/ApiEvent.dart';
import 'package:go_chat/API/EventTypes.dart';

class ChannelSubscribeMessage extends ApiEvent {
  ChannelSubscribeMessage(): super(EventTypes.ChannelSubscribe) {}
}
