library tictactoe_api;

import 'package:endpoints/endpoints.dart';
import 'package:gcloud/db.dart';
import 'package:appengine/appengine.dart';
import 'dart:async';

part 'tictactoe_api_messages.dart';

@ApiClass(
  name: 'tictactoe',
  version: 'v1',
  description: 'Tic Tac Toe API',
  allowedClientIds: const [
    '<YOUR_CLIENT_ID>',
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
  Future<ListResponse<Score>> listScores(ListRequest<Score> request, ApiUser user) {
    var query = request.query;
    query.filter('player =', user.id);
    if (request.order == null) {
      query.order('-played');
    }
    return query.run().toList().then((List<Score> list) => new ListResponse<Score>(list));
  }

  @ApiMethod(
    path: 'scores',
    name: 'scores.insert',
    method: 'POST',
    description: 'Insert a score for the current user',
    requestFields: const ['outcome'],
    requestName: 'ScoreSubmission'
  )
  Future<Score> insertScores(Score score, ApiUser user) {
    score.player = user.id;

    return context.services.db.commit(inserts: [score]).then((_) => score);
  }
}
