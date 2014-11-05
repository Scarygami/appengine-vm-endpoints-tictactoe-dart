library myapi.tictactoe.v1;

import "dart:core" as core;
import "dart:collection" as collection;
import "dart:async" as async;
import "dart:convert" as convert;

import "package:crypto/crypto.dart" as crypto;
import 'package:http/http.dart' as http;
import '../src/common_internal.dart' as common_internal;
import '../common/common.dart' as common;

export '../common/common.dart' show ApiRequestError;
export '../common/common.dart' show DetailedApiRequestError;

/** Tic Tac Toe API */
class TictactoeApi {
  /** View your email address */
  static const UserinfoEmailScope = "https://www.googleapis.com/auth/userinfo.email";

  /** View your basic profile info */
  static const UserinfoProfileScope = "https://www.googleapis.com/auth/userinfo.profile";


  final common_internal.ApiRequester _requester;

  BoardResourceApi get board => new BoardResourceApi(_requester);
  ScoresResourceApi get scores => new ScoresResourceApi(_requester);

  TictactoeApi(http.Client client) :
    _requester = new common_internal.ApiRequester(client, "https://dart-endpoints.appspot.com/", "/_ah/api/tictactoe/v1/");
}


/** Not documented yet. */
class BoardResourceApi {
  final common_internal.ApiRequester _requester;

  BoardResourceApi(common_internal.ApiRequester client) :
      _requester = client;

  /**
   * Simulate a computer move in a TicTacToe game
   *
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [Board].
   *
   * Completes with a [common.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<Board> getmove(Board request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = common.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }


    _url = 'board';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new Board.fromJson(data));
  }

}


/** Not documented yet. */
class ScoresResourceApi {
  final common_internal.ApiRequester _requester;

  ScoresResourceApi(common_internal.ApiRequester client) :
      _requester = client;

  /**
   * Insert a score for the current user
   *
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [Score].
   *
   * Completes with a [common.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<Score> insert(ScoreSubmission request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = common.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }


    _url = 'scores';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new Score.fromJson(data));
  }

  /**
   * Query scores for the current user
   *
   * Request parameters:
   *
   * [limit] - Number of scores to return in one request
   *
   * [order] - Sort order of scores in response
   * Possible string values are:
   * - "TEXT" : Return scores sorted by outcome value
   * - "WHEN" : Return most recent scores first
   *
   * Completes with a [ScoreList].
   *
   * Completes with a [common.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method  will complete with the same error.
   */
  async.Future<ScoreList> list({core.int limit, core.String order}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = common.DownloadOptions.Metadata;
    var _body = null;

    if (limit != null) {
      _queryParams["limit"] = ["${limit}"];
    }
    if (order != null) {
      _queryParams["order"] = [order];
    }


    _url = 'scores';

    var _response = _requester.request(_url,
                                       "GET",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new ScoreList.fromJson(data));
  }

}



/** Not documented yet. */
class Board {
  /** Current state of the game */
  core.String state;


  Board();

  Board.fromJson(core.Map _json) {
    if (_json.containsKey("state")) {
      state = _json["state"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (state != null) {
      _json["state"] = state;
    }
    return _json;
  }
}


/** Not documented yet. */
class Score {
  /** Result of the game. */
  core.String outcome;

  /** Time stamp, will be added automatically when the score is recorded. */
  core.DateTime played;

  /** Google ID of the player */
  core.String player;


  Score();

  Score.fromJson(core.Map _json) {
    if (_json.containsKey("outcome")) {
      outcome = _json["outcome"];
    }
    if (_json.containsKey("played")) {
      played = core.DateTime.parse(_json["played"]);
    }
    if (_json.containsKey("player")) {
      player = _json["player"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (outcome != null) {
      _json["outcome"] = outcome;
    }
    if (played != null) {
      _json["played"] = (played).toIso8601String();
    }
    if (player != null) {
      _json["player"] = player;
    }
    return _json;
  }
}


/** Not documented yet. */
class ScoreList {
  /** Not documented yet. */
  core.List<Score> items;


  ScoreList();

  ScoreList.fromJson(core.Map _json) {
    if (_json.containsKey("items")) {
      items = _json["items"].map((value) => new Score.fromJson(value)).toList();
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (items != null) {
      _json["items"] = items.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}


/** Not documented yet. */
class ScoreSubmission {
  /** Result of the game. */
  core.String outcome;


  ScoreSubmission();

  ScoreSubmission.fromJson(core.Map _json) {
    if (_json.containsKey("outcome")) {
      outcome = _json["outcome"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (outcome != null) {
      _json["outcome"] = outcome;
    }
    return _json;
  }
}


