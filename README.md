# appengine-vm-endpoints-tictactoe-dart

### Description

A simple Tic Tac Toe game using Google Cloud Endpoints, App Engine, Managed VMs and Dart.

See [dart_endpoints](https://github.com/Scarygami/dart_endpoints) for the library used to create and serve the API.

### Notes

The included [TicTacToe client library](dependencies/myapi)
is configured to use https://dart-endpoints.appspot.com/ as API root.

If you want to host it yourself you will need to update the client library
for your App Engine project. You have two options to do this.

You will also have to replace the Client ID in [web/tictactoe.dart](web/tictactoe.dart#L14)
and [lib/tictactoe_api.dart](lib/tictactoe_api.dart#L13) with your own.

##### The proper way

1.  Deploy the project to your App Engine project.
2.  Create client library from your project following [these instructions](https://github.com/Scarygami/dart_endpoints#using-your-api)
3.  Replace the included client library with your generated one
4.  Deploy your project again.


##### The easy way

Change the URL in [lib/tictactoe/v1.dart](dependencies/myapi/lib/tictactoe/v1.dart#L31).

This only works as long as your are not planning to make any changes to the API.
If you make any changes to the API you will have to follow the proper way.
