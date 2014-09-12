library myapi.tictactoe.v1.test;

import "dart:core" as core;
import "dart:collection" as collection;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as http_testing;
import 'package:unittest/unittest.dart' as unittest;
import 'package:myapi/common/common.dart' as common;
import 'package:myapi/src/common_internal.dart' as common_internal;
import '../common/common_internal_test.dart' as common_test;

import 'package:myapi/tictactoe/v1.dart' as api;



core.int buildCounterBoard = 0;
buildBoard() {
  var o = new api.Board();
  buildCounterBoard++;
  if (buildCounterBoard < 3) {
    o.state = "foo";
  }
  buildCounterBoard--;
  return o;
}

checkBoard(api.Board o) {
  buildCounterBoard++;
  if (buildCounterBoard < 3) {
    unittest.expect(o.state, unittest.equals('foo'));
  }
  buildCounterBoard--;
}

core.int buildCounterScore = 0;
buildScore() {
  var o = new api.Score();
  buildCounterScore++;
  if (buildCounterScore < 3) {
    o.outcome = "foo";
    o.played = core.DateTime.parse("2002-02-27T14:01:02");
    o.player = "foo";
  }
  buildCounterScore--;
  return o;
}

checkScore(api.Score o) {
  buildCounterScore++;
  if (buildCounterScore < 3) {
    unittest.expect(o.outcome, unittest.equals('foo'));
    unittest.expect(o.played, unittest.equals(core.DateTime.parse("2002-02-27T14:01:02")));
    unittest.expect(o.player, unittest.equals('foo'));
  }
  buildCounterScore--;
}

buildUnnamed0() {
  var o = new core.List<api.Score>();
  o.add(buildScore());
  o.add(buildScore());
  return o;
}

checkUnnamed0(core.List<api.Score> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkScore(o[0]);
  checkScore(o[1]);
}

core.int buildCounterScoreList = 0;
buildScoreList() {
  var o = new api.ScoreList();
  buildCounterScoreList++;
  if (buildCounterScoreList < 3) {
    o.items = buildUnnamed0();
  }
  buildCounterScoreList--;
  return o;
}

checkScoreList(api.ScoreList o) {
  buildCounterScoreList++;
  if (buildCounterScoreList < 3) {
    checkUnnamed0(o.items);
  }
  buildCounterScoreList--;
}

core.int buildCounterScoreSubmission = 0;
buildScoreSubmission() {
  var o = new api.ScoreSubmission();
  buildCounterScoreSubmission++;
  if (buildCounterScoreSubmission < 3) {
    o.outcome = "foo";
  }
  buildCounterScoreSubmission--;
  return o;
}

checkScoreSubmission(api.ScoreSubmission o) {
  buildCounterScoreSubmission++;
  if (buildCounterScoreSubmission < 3) {
    unittest.expect(o.outcome, unittest.equals('foo'));
  }
  buildCounterScoreSubmission--;
}


main() {
  unittest.group("obj-schema-Board", () {
    unittest.test("to-json--from-json", () {
      var o = buildBoard();
      var od = new api.Board.fromJson(o.toJson());
      checkBoard(od);
    });
  });


  unittest.group("obj-schema-Score", () {
    unittest.test("to-json--from-json", () {
      var o = buildScore();
      var od = new api.Score.fromJson(o.toJson());
      checkScore(od);
    });
  });


  unittest.group("obj-schema-ScoreList", () {
    unittest.test("to-json--from-json", () {
      var o = buildScoreList();
      var od = new api.ScoreList.fromJson(o.toJson());
      checkScoreList(od);
    });
  });


  unittest.group("obj-schema-ScoreSubmission", () {
    unittest.test("to-json--from-json", () {
      var o = buildScoreSubmission();
      var od = new api.ScoreSubmission.fromJson(o.toJson());
      checkScoreSubmission(od);
    });
  });


  unittest.group("resource-BoardResourceApi", () {
    unittest.test("method--getmove", () {

      var mock = new common_test.HttpServerMock();
      api.BoardResourceApi res = new api.TictactoeApi(mock).board;
      var arg_request = buildBoard();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Board.fromJson(json);
        checkBoard(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 22), unittest.equals("/_ah/api/tictactoe/v1/"));
        pathOffset += 22;
        unittest.expect(path.substring(pathOffset, pathOffset + 5), unittest.equals("board"));
        pathOffset += 5;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildBoard());
        return new async.Future.value(common_test.stringResponse(200, h, resp));
      }), true);
      res.getmove(arg_request).then(unittest.expectAsync(((api.Board response) {
        checkBoard(response);
      })));
    });

  });


  unittest.group("resource-ScoresResourceApi", () {
    unittest.test("method--insert", () {

      var mock = new common_test.HttpServerMock();
      api.ScoresResourceApi res = new api.TictactoeApi(mock).scores;
      var arg_request = buildScoreSubmission();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.ScoreSubmission.fromJson(json);
        checkScoreSubmission(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 22), unittest.equals("/_ah/api/tictactoe/v1/"));
        pathOffset += 22;
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("scores"));
        pathOffset += 6;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildScore());
        return new async.Future.value(common_test.stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request).then(unittest.expectAsync(((api.Score response) {
        checkScore(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new common_test.HttpServerMock();
      api.ScoresResourceApi res = new api.TictactoeApi(mock).scores;
      var arg_limit = 42;
      var arg_order = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 22), unittest.equals("/_ah/api/tictactoe/v1/"));
        pathOffset += 22;
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("scores"));
        pathOffset += 6;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["limit"].first), unittest.equals(arg_limit));
        unittest.expect(queryMap["order"].first, unittest.equals(arg_order));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildScoreList());
        return new async.Future.value(common_test.stringResponse(200, h, resp));
      }), true);
      res.list(limit: arg_limit, order: arg_order).then(unittest.expectAsync(((api.ScoreList response) {
        checkScoreList(response);
      })));
    });

  });


}

