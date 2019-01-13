import 'package:angular/angular.dart';
import 'package:go_chat/services/ChatService.dart';

@Component(
  selector: 'messages-list',
  templateUrl: 'messages_list.html',
  directives: [NgFor],
  providers: [ClassProvider(ChatService)],
)
class MessagesList implements OnInit {
  List<String> messages = List<String>();
  ChatService _chatService;
  
  MessagesList(this._chatService);
  
  void ngOnInit() {
    _chatService.listenForMessages(onMessagesAdd);
  }

  void onMessagesAdd(List<String> newMessages) {
    this.messages.addAll(newMessages);
  }
}
