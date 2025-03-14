import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;

  // Access the HTTP method.
  final method = request.method.value;
  final greeting = await context.read<Future<String>>();
  final params = request.uri.queryParameters;

  return Response(body: greeting);
}
