import 'package:endpoints/endpoints.dart';
import 'package:appengine/appengine.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_appengine/shelf_appengine.dart' as shelf_ae;
import 'tictactoe_api.dart';

_handler(Request request) {
  var headers = {'Content-Type' : 'text/plain'};

  if (request.url.toString() != '/') {
    return ApiServer.cascadeResponse;
  }

  return context.assets.read('/index.html').then((stream) {
    return new Response.ok(stream);
  });
}

void main() {
  var api_server = new ApiServer();
  api_server.addApi(new TicTacToe());
  var cascade = new Cascade(statusCodes: [501])
    .add(api_server.handler)
    .add(_handler)
    .add(shelf_ae.assetHandler);

  shelf_ae.serve(cascade.handler);
}
