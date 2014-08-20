import 'package:endpoints/endpoints.dart';
import 'package:cloud_datastore/cloud_datastore.dart';
import 'package:appengine/appengine.dart';
import 'dart:async';

import 'tictactoe_api_messages.dart';

@ApiClass(
  name: 'tictactoe',
  version: 'v1',
  description: 'Tic Tac Toe API',
  allowedClientIds: const [API_EXPLORER_CLIENT_ID]
)
class TicTacToe {

  @ApiMethod(
    path: 'board',
    name: 'board.getmove',
    method: 'POST',
    description: 'Simulate a computer move in a TicTacToe game'
  )
  Board move(Board board) {
    // TODO: manipulate board.state by adding a single 'O' in a free space
    return board;
  }

  @ApiMethod(
    path: 'scores',
    name: 'scores.list',
    method: 'GET',
    description: 'Query scores for the current user'
  )
  Future<ScoreList> listScores(ScoreListRequest request, ApiUser user) {
    // TODO: retrieve scores for authenticated user from db
    return new Future.value(new ScoreList());
  }

  @ApiMethod(
    path: 'scores',
    name: 'scores.insert',
    method: 'POST',
    description: 'Insert a score for the current user'
  )
  Future<Score> insertScores(ScoreRequest request, ApiUser user) {
    var score = new Score();
    score.player = user.id;
    score.outcome = request.outcome;

    // TODO: insert data into db
    return new Future.value(score);
  }
}
