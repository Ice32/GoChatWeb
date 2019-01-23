import 'package:angular/angular.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:go_chat/services/ChatService.dart';

@Component(
  selector: 'channel-input',
  templateUrl: 'channel_input.html',
  directives: [
    formDirectives,
    materialInputDirectives,
  ],
  providers: [ClassProvider(ChatService)],
)
class ChannelInput {
  ChatService _chatService;
  ChannelInput(this._chatService);
  var channelName = '';

  void onReturnKeyPress(String e) {
    if (e.length > 1) {
      onSubmit();
    }
    channelName = '';
  }

  void onSubmit() {
    _chatService.addChannel(channelName);
  }
}
