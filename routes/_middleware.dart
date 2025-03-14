import 'dart:async';
import 'package:dart_frog/dart_frog.dart';
import 'package:dartfrogtest/services/authenticator.dart';

Handler middleware(Handler handler) {
  return handler.use(
    provider<Authenticator>(
      (_) => Authenticator(),
    ),
  );
}
