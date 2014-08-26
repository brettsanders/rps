class RPS
  MOVES = ['rock', 'paper', 'scissors']
  RULES = [
    { winner: 'rock',     loser: 'scissors' },
    { winner: 'scissors', loser: 'paper'    },
    { winner: 'paper',    loser: 'rock'     }
  ]

  attr_accessor :player_move, :computer_move, :winner, :loser, :tie

  def initialize
    @player_move = nil
    @computer_move = nil
    @winner = nil
    @loser = nil
    @tie = nil
  end

  def play(player_move, computer_move = MOVES.sample)
    winner, loser, tie = check_for_winner_loser_tie(player_move, computer_move)
    save_game_state player_move, computer_move, winner, loser, tie
  end

  private
    def check_for_winner_loser_tie player_move, computer_move
      return [false, false, true] if player_move == computer_move

      current_game_moves = [player_move, computer_move]

      RULES.each do |rule|
        moves_for_rule = [rule[:winner], rule[:loser]]
        if moves_for_rule.sort == current_game_moves.sort
          winning_move = rule[:winner]

          winner = player_move == winning_move ? :player : :computer
          loser = winner == :player ? :computer : :player

          return winner, loser, false
        end
      end
    end

    def save_game_state player_move, computer_move, winner, loser, tie
      self.player_move = player_move
      self.computer_move = computer_move
      self.winner = winner
      self.loser = loser
      self.tie = tie
    end
end