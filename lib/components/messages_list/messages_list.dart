import 'package:angular/angular.dart';
import 'package:go_chat/API/types/ChatMessage.dart';
import 'package:go_chat/services/ChatService.dart';

@Component(
  selector: 'messages-list',
  templateUrl: 'messages_list.html',
  directives: [NgFor],
  providers: [ClassProvider(ChatService)],
)
class MessagesList implements OnChanges {
  List<ChatMessage> messages = List<ChatMessage>();
  ChatService _chatService;
  
  MessagesList(this._chatService);

  @Input("selectedChannel")
  String selectedChannel;
  
  void onChannelOpen(String channelId) {
    _chatService.listenForMessages(channelId, onMessagesAdd);
  }

  void onMessagesAdd(List<ChatMessage> newMessages) {
    this.messages.addAll(newMessages);
  }

  void ngOnChanges(Map<String, SimpleChange> changes) {
    SimpleChange selectedChannel = changes["selectedChannel"];
    if (selectedChannel.previousValue != selectedChannel.currentValue) {
      onChannelOpen(selectedChannel.currentValue);
    }
  }
}
