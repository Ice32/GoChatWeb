import 'package:go_chat/API/ApiEvent.dart';

class MessageAddEvent extends ApiEvent {
  MessageAddEvent(String message): super('MessageAdd') {
    this.data = message;
  }
}
