import 'package:go_chat/API/ApiEvent.dart';

class ChannelAddEvent extends ApiEvent {
  List<String> data = List<String>();

  ChannelAddEvent(List<String> data): super('ChannelAdd') {
    this.data = data;
  }
}
