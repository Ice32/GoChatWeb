import 'package:go_chat/API/ApiEvent.dart';
import 'package:go_chat/API/types/NewChatMessage.dart';

class MessageAddMessage extends ApiEvent {
  MessageAddMessage(NewChatMessage message): super('MessageAdd') {
    this.data = message;
  }
}
