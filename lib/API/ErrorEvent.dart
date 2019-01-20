import 'package:go_chat/API/ApiEvent.dart';
import 'package:go_chat/API/EventTypes.dart';

class ErrorEvent extends ApiEvent {
  ErrorEvent(dynamic errorData): super(EventTypes.Error) {
    this.data = errorData;
  }
}
