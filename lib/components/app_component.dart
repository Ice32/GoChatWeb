import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:go_chat/components/messages_container/messages_container.dart';
import 'package:go_chat/components/channels_list/channels_list.dart';
import 'package:go_chat/components/messages_list/messages_list.dart';
import 'package:go_chat/components/username_input/username_input.dart';
import 'package:go_chat/services/ChatService.dart';

@Component(
  selector: 'my-app',
  templateUrl: './app_component.html',
  directives: [ChannelsList, MessagesContainer, MessagesList, UsernameInput],
  styleUrls: ['./app_component.css'],
  providers: const <dynamic>[materialProviders, ClassProvider(ChatService)],
)
class AppComponent implements OnInit {
  ChatService _chatService;
  String selectedChannel;
  String username;

  AppComponent(this._chatService);

  void channelSelected(String channelId) {
    selectedChannel = channelId;
  }
  void usernameChanged(String username) {
    this.username = username;
  }

  @override
  void ngOnInit() async {
    _chatService.listenForErrors(_onError);
  }

  void _onError(String error) {
    print(error);
  }
}
