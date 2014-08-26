part of tictactoe_v1_api;

class Board {

  /** Current state of the game */
  core.String state;

  /** Create new Board from JSON data */
  Board.fromJson(core.Map json) {
    if (json.containsKey("state")) {
      state = json["state"];
    }
  }

  /** Create JSON Object for Board */
  core.Map toJson() {
    var output = new core.Map();

    if (state != null) {
      output["state"] = state;
    }

    return output;
  }

  /** Return String representation of Board */
  core.String toString() => JSON.encode(this.toJson());

}

class Score {

  /** Result of the game. */
  core.String outcome;

  /** Time stamp, will be added automatically when the score is recorded. */
  core.String played;

  /** Google ID of the player */
  core.String player;

  /** Create new Score from JSON data */
  Score.fromJson(core.Map json) {
    if (json.containsKey("outcome")) {
      outcome = json["outcome"];
    }
    if (json.containsKey("played")) {
      played = json["played"];
    }
    if (json.containsKey("player")) {
      player = json["player"];
    }
  }

  /** Create JSON Object for Score */
  core.Map toJson() {
    var output = new core.Map();

    if (outcome != null) {
      output["outcome"] = outcome;
    }
    if (played != null) {
      output["played"] = played;
    }
    if (player != null) {
      output["player"] = player;
    }

    return output;
  }

  /** Return String representation of Score */
  core.String toString() => JSON.encode(this.toJson());

}

class ScoreList {

  core.List<Score> items;

  /** Create new ScoreList from JSON data */
  ScoreList.fromJson(core.Map json) {
    if (json.containsKey("items")) {
      items = json["items"].map((itemsItem) => new Score.fromJson(itemsItem)).toList();
    }
  }

  /** Create JSON Object for ScoreList */
  core.Map toJson() {
    var output = new core.Map();

    if (items != null) {
      output["items"] = items.map((itemsItem) => itemsItem.toJson()).toList();
    }

    return output;
  }

  /** Return String representation of ScoreList */
  core.String toString() => JSON.encode(this.toJson());

}

class ScoreSubmission {

  /** Result of the game. */
  core.String outcome;

  /** Create new ScoreSubmission from JSON data */
  ScoreSubmission.fromJson(core.Map json) {
    if (json.containsKey("outcome")) {
      outcome = json["outcome"];
    }
  }

  /** Create JSON Object for ScoreSubmission */
  core.Map toJson() {
    var output = new core.Map();

    if (outcome != null) {
      output["outcome"] = outcome;
    }

    return output;
  }

  /** Return String representation of ScoreSubmission */
  core.String toString() => JSON.encode(this.toJson());

}

core.Map _mapMap(core.Map source, [core.Object convert(core.Object source) = null]) {
  assert(source != null);
  var result = new dart_collection.LinkedHashMap();
  source.forEach((core.String key, value) {
    assert(key != null);
    if(convert == null) {
      result[key] = value;
    } else {
      result[key] = convert(value);
    }
  });
  return result;
}
