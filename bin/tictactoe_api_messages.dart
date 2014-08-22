import 'package:endpoints/endpoints.dart';
import 'package:cloud_datastore/cloud_datastore.dart';

@ModelMetadata(const ScoreDesc())
class Score extends Model {
  @ApiProperty(description: 'Datastore ID of the Score', variant: 'uint64')
  int id;

  @ApiProperty(description: 'Result of the game.')
  String outcome;

  @ApiProperty(description: 'Time stamp, will be added automatically when the score is recorded.')
  DateTime played;

  @ApiProperty(description: 'Google ID of the player')
  String player;

  Score() {
    // Automatically set current date for new messages
    played = new DateTime.now();
  }
}

class ScoreDesc extends ModelDescription {
  final id = const IntProperty();
  final outcome = const StringProperty();
  final played = const DateTimeProperty();
  final player = const StringProperty();

  const ScoreDesc(): super('Score');
}

class ScoreList {
  List<Score> items;

  ScoreList([this.items = const []]);
}

class ScoreListRequest {
  @ApiProperty(description: 'Number of scores to return in one request')
  int limit;

  @ApiProperty(
    values: const {
      'WHEN': 'Return most recent scores first',
      'TEXT': 'Return scores sorted by outcome value'
    },
    description: 'Sort order of scores in response'
  )
  String order;
}

class ScoreRequest {
  @ApiProperty(description: 'Score to be inserted')
  String outcome;
}

class Board {
  @ApiProperty(description: 'Current state of the game')
  String state;

  Board([this.state]);
}
