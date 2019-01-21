import 'dart:async';
import 'dart:math';

import 'package:angular/angular.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'username-input',
  templateUrl: 'username_input.html',
  directives: [
    formDirectives,
    materialInputDirectives,
  ],
)
class UsernameInput implements OnInit {
  String username;

  final _onUsernameChangeController = StreamController<String>.broadcast();
  @Output('onUsernameChange')
  Stream<String> get usernameChange => _onUsernameChangeController.stream;

  void onUsernameChange() {
    _onUsernameChangeController.add(username);
  }

  @override
  void ngOnInit() {
    _setDefaultUsername();
  }

  void _setDefaultUsername () {
    username = 'user ' + Random().nextInt(1000).toString();
    _onUsernameChangeController.add(username);
  }
}
