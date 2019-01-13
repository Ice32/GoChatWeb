import 'dart:async';

import 'package:angular/angular.dart';
import 'package:go_chat/API/types/Channel.dart';
import 'package:go_chat/services/ChatService.dart';

@Component(
  selector: 'channels-list',
  templateUrl: 'channels_list.html',
  providers: [ClassProvider(ChatService)],
  directives: [NgFor, NgClass],
  styleUrls: const ['./channels_list.component.css'],
)
class ChannelsList implements OnInit {
  ChatService _chatService;
  List<Channel> channels = List<Channel>();
  String selectedChannel = null;

  ChannelsList(this._chatService);
  final _onChannelSelectController = StreamController<String>.broadcast();
  @Output()
  Stream<String> get onChannelSelect => _onChannelSelectController.stream;

  @override
  void ngOnInit() async {
    _chatService.listenForChannels(onChannelAdd);
  }

  void onChannelAdd(List<Channel> newChannels) {
    this.channels.addAll(newChannels);
  }

  void onChannelSelected(String channelId) {
    selectedChannel = channelId;
    _onChannelSelectController.add(channelId);
  }
}
