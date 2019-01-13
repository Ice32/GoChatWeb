import 'package:go_chat/API/ApiEvent.dart';
import 'package:go_chat/API/types/ChatMessage.dart';

class MessageAddEvent extends ApiEvent {
  MessageAddEvent(List<ChatMessage> messages): super('MessageAdd') {
    this.data = messages;
  }
}
