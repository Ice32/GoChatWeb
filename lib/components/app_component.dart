import 'package:angular/angular.dart';
import 'package:go_chat/components/channel_messages/channel_messages.dart';
import 'package:go_chat/components/channels_list/channels_list.dart';

@Component(
  selector: 'my-app',
  templateUrl: './app_component.html',
  directives: [ChannelsList, ChannelMessages],
  styleUrls: ['./app_component.css']
)
class AppComponent {}
