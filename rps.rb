class RPS
  attr_accessor :tie

  def initialize
    @tie = false
  end

  def play(player_move, computer_move)
    if player_move == computer_move
      self.tie = true
    end
  end
end