import 'package:angular/angular.dart';
import 'package:go_chat/components/messages_container/messages_container.dart';
import 'package:go_chat/components/channels_list/channels_list.dart';
import 'package:go_chat/components/messages_list/messages_list.dart';

@Component(
  selector: 'my-app',
  templateUrl: './app_component.html',
  directives: [ChannelsList, MessagesContainer, MessagesList],
  styleUrls: ['./app_component.css']
)
class AppComponent {}
