library hop_runner;

import 'package:hop/hop.dart';
import 'package:hop/hop_tasks.dart';

void main(List<String> args) {

  List pathList = [
    'lib/tictactoe_v1_api_browser.dart',
    'lib/tictactoe_v1_api_console.dart',
    'lib/tictactoe_v1_api_client.dart'
  ];

  // TODO(adam): re enable when hop_docgen is available
  // addTask('docs', createDartDocTask(pathList, linkApi: true));

  addTask('analyze', createAnalyzerTask(pathList));

  runHop(args);
}
