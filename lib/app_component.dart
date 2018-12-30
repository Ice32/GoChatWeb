import 'package:angular/angular.dart';
import 'package:go_chat/API/ApiSocket.dart';
import 'package:go_chat/API/ChannelAddEvent.dart';
import 'package:go_chat/API/ChannelSubscribeMessage.dart';
import 'package:go_chat/API/EventTypes.dart';

@Component(
  selector: 'my-app',
  template: '<div *ngFor="let channel of channels">{{channel}}</div>',
  providers: [ClassProvider(ApiSocket)],
  directives: [NgFor]
)
class AppComponent implements OnInit {
  ApiSocket _apiSocket;
  List<String> channels = List<String>();

  AppComponent(this._apiSocket);

  @override
  void ngOnInit() async {
    _apiSocket.subscribe(EventTypes.ChannelAdd, this.onChannelAdd);
    _apiSocket.send(ChannelSubscribeMessage());
  }

  void onChannelAdd(ChannelAddEvent event) {
    this.channels.addAll(event.data);
  }
}
