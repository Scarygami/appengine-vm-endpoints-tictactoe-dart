part of tictactoe_api;

@ModelMetadata(const ScoreDesc())
class Score extends Model {
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

class Board {
  @ApiProperty(description: 'Current state of the game')
  String state;

  Board([this.state]);
}
