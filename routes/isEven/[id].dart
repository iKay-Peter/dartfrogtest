import 'dart:io';
import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context, String id) {
  final number = int.tryParse(id);
  if (number == null) {
    return Response.json(
      statusCode: HttpStatus.badRequest,
      body: {'error': 'Invalid number'},
    );
  }

  return Response.json(body: {'number': number, 'isEven': (number % 2) == 0});
}
