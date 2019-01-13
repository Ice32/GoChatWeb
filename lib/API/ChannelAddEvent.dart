import 'package:go_chat/API/ApiEvent.dart';
import 'package:go_chat/API/types/Channel.dart';

class ChannelAddEvent extends ApiEvent {
  ChannelAddEvent(List<Channel> data): super('ChannelAdd') {
    this.data = data;
  }
}
