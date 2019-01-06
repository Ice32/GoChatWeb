import 'package:angular/angular.dart';
import 'package:go_chat/API/ApiSocket.dart';
import 'package:go_chat/components/app_component.template.dart' as ng;

import 'main.template.dart' as self;

@GenerateInjector([
  ClassProvider(ApiSocket),
])
final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
