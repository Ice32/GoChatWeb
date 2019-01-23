import 'dart:html';

import 'package:angular/angular.dart';
import 'package:go_chat/components/message_input/message_input.dart';
import 'package:go_chat/components/messages_list/messages_list.dart';

@Component(
  selector: 'messages-container',
  templateUrl: 'messages_container.html',
  styleUrls: const ['./messages_container.css'],
  directives: [MessagesList, MessageInput, NgIf],
)
class MessagesContainer implements AfterViewChecked{
  @Input("selectedChannel")
  String selectedChannel;

  @Input("username")
  String username;

  @ViewChild('messagesListContainer') HtmlElement messagesListContainer;

  ngOnInit() {
    this._scrollToBottom();
  }

  ngAfterViewChecked() {
    this._scrollToBottom();
  }

  void _scrollToBottom(){
    this.messagesListContainer.scrollTop = this.messagesListContainer.scrollHeight;
  }
}
