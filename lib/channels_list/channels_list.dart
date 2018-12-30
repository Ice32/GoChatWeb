import 'package:angular/angular.dart';
import 'package:go_chat/API/ApiSocket.dart';
import 'package:go_chat/API/ChannelAddEvent.dart';
import 'package:go_chat/API/ChannelSubscribeMessage.dart';
import 'package:go_chat/API/EventTypes.dart';

@Component(
  selector: 'channels-list',
  templateUrl: 'channels_list.html',
  providers: [ClassProvider(ApiSocket)],
  directives: [NgFor],
  styleUrls: const ['./channels_list.component.css'],
)
class ChannelsList implements OnInit {
  ApiSocket _apiSocket;
  List<String> channels = List<String>();

  ChannelsList(this._apiSocket);

  @override
  void ngOnInit() async {
    _apiSocket.subscribe(EventTypes.ChannelAdd, this.onChannelAdd);
    _apiSocket.send(ChannelSubscribeMessage());
  }

  void onChannelAdd(ChannelAddEvent event) {
    this.channels.addAll(event.data);
  }
}
