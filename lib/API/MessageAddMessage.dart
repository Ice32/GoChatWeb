import 'package:go_chat/API/ApiEvent.dart';

class MessageAddMessage extends ApiEvent {
  MessageAddMessage(String message): super('MessageAdd') {
    this.data = message;
  }
}
