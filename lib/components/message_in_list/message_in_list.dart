import 'package:angular/angular.dart';
import 'package:go_chat/API/types/ChatMessage.dart';

@Component(
  selector: 'message-in-list',
  templateUrl: 'message_in_list.html',
  styleUrls: const ['./message_in_list.css'],
  directives: [NgIf]
)
class MessageInList {
  @Input('data')
  ChatMessage data;

  @Input('displayAuthor')
  bool displayAuthor;
}
