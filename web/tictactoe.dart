import 'dart:html';
import 'package:tictactoe_v1_api/tictactoe_v1_api_browser.dart' as tttApi;
import 'package:tictactoe_v1_api/tictactoe_v1_api_client.dart' as ttt;
import 'package:google_oauth2_client/google_oauth2_browser.dart';
import 'package:google_plus_v1_api/plus_v1_api_browser.dart' as plusApi;

final auth = new GoogleOAuth2('390037016754-ip34lpdqk9m0ovn1nal65h61s5jiknut.apps.googleusercontent.com', ['profile']);
final plus = new plusApi.Plus(auth);
final tictactoe = new tttApi.Tictactoe(auth);

void startGame() {

}

void resetGame() {

}

void handleAuth(Token t) {
  if (t != null) {
    querySelector('#signIn').style.display = 'none';
    plus.makeAuthRequests = true;
    plus.people.get('me', optParams: {'fields': 'displayName'}).then((p) {
      querySelector('#user').innerHtml = p.displayName;
      startGame();
    });
  } else {
    querySelector('#signIn').style.display = 'block';
    querySelector('#user').innerHtml = '';
    resetGame();
  }
}

void main() {
  auth.login(immediate: true).then(handleAuth).catchError((_) => handleAuth(null));
  querySelector('#signInButton').onClick.listen((_) {
    auth.login().then(handleAuth).catchError((_) => handleAuth(null));
  });
}

