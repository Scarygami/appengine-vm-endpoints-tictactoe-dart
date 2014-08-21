library tictactoe_v1_api.browser;

import "package:google_oauth2_client/google_oauth2_browser.dart" as oauth;

import 'package:tictactoe_v1_api/src/browser_client.dart';
import "package:tictactoe_v1_api/tictactoe_v1_api_client.dart";

/** Tic Tac Toe API */
class Tictactoe extends Client with BrowserClient {

  /** OAuth Scope2: View your email address */
  static const String USERINFO_EMAIL_SCOPE = "https://www.googleapis.com/auth/userinfo.email";

  /** OAuth Scope2: View your basic profile info */
  static const String USERINFO_PROFILE_SCOPE = "https://www.googleapis.com/auth/userinfo.profile";

  final oauth.OAuth2 auth;

  Tictactoe([oauth.OAuth2 this.auth]);
}
