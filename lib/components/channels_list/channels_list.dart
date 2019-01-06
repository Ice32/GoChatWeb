import 'package:angular/angular.dart';
import 'package:go_chat/services/ChatService.dart';

@Component(
  selector: 'channels-list',
  templateUrl: 'channels_list.html',
  providers: [ClassProvider(ChatService)],
  directives: [NgFor],
  styleUrls: const ['./channels_list.component.css'],
)
class ChannelsList implements OnInit {
  ChatService _chatService;
  List<String> channels = List<String>();

  ChannelsList(this._chatService);

  @override
  void ngOnInit() async {
    _chatService.listenForChannels(onChannelAdd);
  }

  void onChannelAdd(List<String> newChannels) {
    this.channels.addAll(newChannels);
  }
}
