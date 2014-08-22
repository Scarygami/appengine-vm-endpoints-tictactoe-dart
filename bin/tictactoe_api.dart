import 'package:endpoints/endpoints.dart';
import 'package:cloud_datastore/cloud_datastore.dart';
import 'package:appengine/appengine.dart';
import 'dart:async';

import 'tictactoe_api_messages.dart';

@ApiClass(
  name: 'tictactoe',
  version: 'v1',
  description: 'Tic Tac Toe API',
  allowedClientIds: const [
    '390037016754-ip34lpdqk9m0ovn1nal65h61s5jiknut.apps.googleusercontent.com',
    API_EXPLORER_CLIENT_ID
  ]
)
class TicTacToe {

  @ApiMethod(
    path: 'board',
    name: 'board.getmove',
    method: 'POST',
    description: 'Simulate a computer move in a TicTacToe game'
  )
  Board move(Board board) {
    var state = board.state.split('');
    if (state.length != 9 || !state.every((c) => ['-', 'X', 'O'].contains(c))) {
      throw new BadRequestError('Invalid board');
    }
    var free = [];
    state.asMap().forEach((i, c) {
      if (c == '-') {
        free.add(i);
      }
    });
    if (free.length == 0) {
      throw new BadRequestError('No free spaces on board');
    }
    // Amazingly clever algorithm to determine the next move
    free.shuffle();
    state[free[0]] = 'O';
    return new Board(state.join());
  }

  @ApiMethod(
    path: 'scores',
    name: 'scores.list',
    method: 'GET',
    description: 'Query scores for the current user'
  )
  Future<ScoreList> listScores(ScoreListRequest request, ApiUser user) {
    var query = context.services.db.query(Score);
    query.filter('player =', user.id);
    if (request.order == 'TEXT') {
      query.order('outcome');
    } else {
      query.order('-played');
    }
    return query.run().then((List<Score> list) => new ScoreList(list));
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

    return context.services.db.commit(inserts: [score]).then((_) => score);
  }
}
