class RPS
  RULES = [
    { winner: 'rock',     loser: 'scissors' },
    { winner: 'scissors', loser: 'paper'    },
    { winner: 'paper',    loser: 'rock'     }
  ]

  attr_accessor :winner, :loser, :tie

  def initialize
    @winner = nil
    @loser = nil
    @tie = nil
  end

  def play(player_move, computer_move)
    if player_move == computer_move
      self.tie = true
      self.winner = false
      self.loser = false
    else
      current_game_moves = [player_move, computer_move]

      RULES.each do |rule|
        moves_for_rule = [rule[:winner], rule[:loser]]
        if moves_for_rule.sort == current_game_moves.sort
          winning_move = rule[:winner]

          winner = player_move == winning_move ? :player : :computer
          loser = winner == :player ? :computer : :player

          self.winner = winner
          self.loser = loser
          self.tie = false
        end
      end

    end
  end
end