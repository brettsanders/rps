require_relative '../rps'

describe "Rock Paper Scissors" do
  describe "Determines Winner, Loser, Tie" do

    describe "When player throws rock" do
      it "and computer throws rock" do
        rps = RPS.new
        rps.play('rock', 'rock')
        expect(rps.tie).to eq true
      end
    end

  end
end