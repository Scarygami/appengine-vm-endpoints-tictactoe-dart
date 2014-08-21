library tictactoe_v1_api.console;

import "package:google_oauth2_client/google_oauth2_console.dart" as oauth2;

import 'package:tictactoe_v1_api/src/console_client.dart';

import "package:tictactoe_v1_api/tictactoe_v1_api_client.dart";

/** Tic Tac Toe API */
class Tictactoe extends Client with ConsoleClient {

  /** OAuth Scope2: View your email address */
  static const String USERINFO_EMAIL_SCOPE = "https://www.googleapis.com/auth/userinfo.email";

  /** OAuth Scope2: View your basic profile info */
  static const String USERINFO_PROFILE_SCOPE = "https://www.googleapis.com/auth/userinfo.profile";

  final oauth2.OAuth2Console auth;

  Tictactoe([oauth2.OAuth2Console this.auth]);
}
