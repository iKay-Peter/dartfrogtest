import 'dart:async';

import 'package:dart_frog/dart_frog.dart';
import 'package:test/test.dart';

Handler middleware(Handler handler) {
  return handler.use(asyncGreetingProvider());
}

Middleware asyncGreetingProvider() {
  return provider<Future<String>>((context) async {
    await Future.delayed(const Duration(seconds: 10), () {});
    return 'Hello';
  });
}
