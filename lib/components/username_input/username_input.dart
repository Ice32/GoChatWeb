import 'dart:async';

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
class UsernameInput {
  final _onUsernameChangeController = StreamController<String>.broadcast();
  @Output('onUsernameChange')
  Stream<String> get usernameChange => _onUsernameChangeController.stream;

  void onUsernameChange(String username) {
    _onUsernameChangeController.add(username);
  }
}
