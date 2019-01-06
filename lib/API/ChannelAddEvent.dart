import 'package:go_chat/API/ApiEvent.dart';

class ChannelAddEvent extends ApiEvent {
  ChannelAddEvent(List<String> data): super('ChannelAdd') {
    this.data = data;
  }
}
