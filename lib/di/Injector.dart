import 'package:flutter_app/rest/ApiProvider.dart';
import 'package:http/http.dart';
import 'package:kiwi/kiwi.dart';

part 'Injector.g.dart';

abstract class Injector {
  @Register.singleton(Client)
  @Register.singleton(ApiProvider)
  void configure();
}

void setupInjector() {
  var injector = _$Injector();
  injector.configure();
}
