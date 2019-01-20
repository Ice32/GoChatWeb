import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:go_chat/API/types/NewChatMessage.dart';
import 'package:go_chat/services/ChatService.dart';

@Component(
  selector: 'message-input',
  templateUrl: 'message_input.html',
  providers: [ClassProvider(ChatService)],
  directives: [
    formDirectives,
    materialInputDirectives,
    MaterialMultilineInputComponent,
  ],
  styleUrls: const ['./message_input.css'],
)
class MessageInput {
  ChatService _chatService;
  String message = '';

  MessageInput(this._chatService);

  @Input("selectedChannel")
  String channelId = null;

  void onSubmit() {
    NewChatMessage newMessage = NewChatMessage(
      message.substring(0, message.length - 1),
      channelId,
    );
    _chatService.addMessage(newMessage);
  }
  void onReturnKeyPress(String e) {
    if (e.length > 1) {
      onSubmit();
    }
    message = '';
  }
}
