part of tictactoe_api;

@Kind()
class Score extends Model {
  @StringProperty()
  @ApiProperty(description: 'Result of the game.')
  String outcome;

  @DateTimeProperty()
  @ApiProperty(description: 'Time stamp, will be added automatically when the score is recorded.')
  DateTime played;

  @StringProperty()
  @ApiProperty(description: 'Google ID of the player')
  String player;

  Score() {
    // Automatically set current date for new messages
    played = new DateTime.now();
  }
}

class Board {
  @ApiProperty(description: 'Current state of the game')
  String state;

  Board([this.state]);
}
