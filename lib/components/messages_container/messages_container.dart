import 'package:angular/angular.dart';
import 'package:go_chat/components/message_input/message_input.dart';
import 'package:go_chat/components/messages_list/messages_list.dart';

@Component(
  selector: 'messages-container',
  templateUrl: 'messages_container.html',
  styleUrls: const ['./messages_container.css'],
  directives: [MessagesList, MessageInput],
)
class MessagesContainer{
  @Input("selectedChannel")
  String selectedChannel;
}
