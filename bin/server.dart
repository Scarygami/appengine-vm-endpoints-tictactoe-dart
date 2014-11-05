import 'package:endpoints/endpoints.dart';
import 'package:appengine/appengine.dart';
import 'package:endpoints_tictactoe/tictactoe_api.dart';

import 'dart:io';

ApiServer api_server;

_handler(HttpRequest request) {
  if (request.uri.path.startsWith('/_ah/spi/')) {
    api_server.handleRequest(request);
    return;
  }
  if (request.uri.path == '/') {
    context.assets.serve('/index.html');
    return;
  }
  context.assets.serve(request.uri.path);
}

void main() {
  api_server = new ApiServer();
  api_server.addApi(new TicTacToe());
  runAppEngine(_handler).then((_) {
    // Server running.
  });
}
