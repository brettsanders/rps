require_relative '../rps'

describe "Rock Paper Scissors" do
  describe "Determines Winner, Loser, Tie" do

    before do
      @rps = RPS.new
    end

    describe "When player throws rock" do
      it "and computer throws rock" do
        @rps.play('rock', 'rock')
        expect(@rps.tie).to eq true
      end
    end

    describe "When player throws paper" do
      it "and computer throws paper" do
        @rps.play('paper', 'paper')
        expect(@rps.tie).to eq true
      end
    end

    describe "When player throws scissors" do
      it "and computer throws scissors" do
        @rps.play('scissors', 'scissors')
        expect(@rps.tie).to eq true
      end
    end

  end
end