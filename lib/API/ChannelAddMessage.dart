import 'package:go_chat/API/ApiEvent.dart';

class ChannelAddMessage extends ApiEvent {
  ChannelAddMessage(String channelName): super('ChannelAdd') {
    this.data = channelName;
  }
}
