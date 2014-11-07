import 'package:endpoints/endpoints.dart';
import 'package:appengine/appengine.dart';
import 'package:endpoints_tictactoe/tictactoe_api.dart';

import 'dart:io';
import 'dart:convert' show UTF8;

ApiServer api_server;

_healthResponse(HttpRequest request) {
  request.drain().then((_) {
    var response = request.response;
    var data = UTF8.encode('ok');
    response.headers.contentType =
      new ContentType('text', 'plain', charset: 'charset=utf-8');
    response.statusCode = 200;
    response.contentLength = data.length;
    response.add(data);
    response.close();
  });
}

_handler(HttpRequest request) {
  if (request.uri.path.startsWith('/_ah/health')) {
    _healthResponse(request);
    return;
  }
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
