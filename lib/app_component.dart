import 'package:angular/angular.dart';
import 'package:go_chat/channels_list/channels_list.dart';

@Component(
  selector: 'my-app',
  template: '<channels-list></channels-list>',
  directives: [ChannelsList],
)
class AppComponent {}
