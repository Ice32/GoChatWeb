import 'package:go_chat/API/ApiEvent.dart';

class MessageAddEvent extends ApiEvent {
  MessageAddEvent(List<String> messages): super('MessageAdd') {
    this.data = messages;
  }
}
