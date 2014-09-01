part of tictactoe_v1_api;

class BoardResource_ {

  final Client _client;

  BoardResource_(Client client) :
      _client = client;

  /**
   * Simulate a computer move in a TicTacToe game
   *
   * [request] - Board to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Board> getmove(Board request, {core.Map optParams}) {
    var url = "board";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Board.fromJson(data));
  }
}

class ScoresResource_ {

  final Client _client;

  ScoresResource_(Client client) :
      _client = client;

  /**
   * Insert a score for the current user
   *
   * [request] - ScoreSubmission to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Score> insert(ScoreSubmission request, {core.Map optParams}) {
    var url = "scores";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Score.fromJson(data));
  }

  /**
   * Query scores for the current user
   *
   * [limit] - Number of items to return in one request
   *   Default: 10
   *
   * [offset] - Offset for paging through results
   *
   * [order] - Define property name for sorting, prefix with - for descending order
   *
   * [optParams] - Additional query parameters
   */
  async.Future<ScoreList> list({core.int limit, core.int offset, core.String order, core.Map optParams}) {
    var url = "scores";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (limit != null) queryParams["limit"] = limit;
    if (offset != null) queryParams["offset"] = offset;
    if (order != null) queryParams["order"] = order;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new ScoreList.fromJson(data));
  }
}

