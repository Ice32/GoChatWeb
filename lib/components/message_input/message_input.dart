import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/material_input/material_input.dart';

@Component(
  selector: 'message-input',
  templateUrl: 'message_input.html',
  directives: [
    formDirectives,
    materialInputDirectives,
    MaterialMultilineInputComponent,
  ],
  styleUrls: const ['./message_input.css'],
)
class MessageInput {
  String channelName = '';

  void onKeyPress(String e) {
    final int enterKeyCode = 10;
    if (e.length == 0) {
      return;
    }
    int lastChar = e.codeUnitAt(e.length - 1);
    if (lastChar == enterKeyCode) {
      if (e.length > 1) {
        print('Submitting');
      }
      channelName = '';
    }
  }
}
