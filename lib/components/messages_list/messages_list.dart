import 'package:angular/angular.dart';
import 'package:go_chat/API/types/ChatMessage.dart';
import 'package:go_chat/components/message_in_list/message_in_list.dart';
import 'package:go_chat/services/ChatService.dart';

@Component(
  selector: 'messages-list',
  templateUrl: 'messages_list.html',
  directives: [NgFor, MessageInList],
  providers: [ClassProvider(ChatService)],
)
class MessagesList implements OnChanges {
  List<ChatMessage> messages = List<ChatMessage>();
  ChatService _chatService;
  
  MessagesList(this._chatService);

  @Input("selectedChannel")
  String selectedChannel = null;
  
  void onChannelOpen(String channelId) {
    _chatService.listenForMessages(channelId, onMessagesAdd);
  }

  void onMessagesAdd(List<ChatMessage> newMessages) {
    this.messages.addAll(newMessages);
  }

  void _unsubscribeFromChannel(String channelId) {
    _chatService.stopListeningForMessages(channelId);
    messages.clear();
  }

  void ngOnChanges(Map<String, SimpleChange> changes) {
    SimpleChange selectedChannel = changes["selectedChannel"];
    if (selectedChannel.previousValue != selectedChannel.currentValue) {
      if (selectedChannel.previousValue != null) {
        _unsubscribeFromChannel(selectedChannel.previousValue);
      }
      onChannelOpen(selectedChannel.currentValue);
    }
  }
}
