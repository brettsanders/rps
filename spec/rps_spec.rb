require_relative '../rps'

describe "Rock Paper Scissors" do
  describe "Determines Winner, Loser, Tie" do

    before do
      @rps = RPS.new
    end

    describe "When player throws rock" do
      it "and computer throws rock" do
        @rps.play('rock', 'rock')
        expect(@rps.winner).to eq false
        expect(@rps.loser).to eq false
        expect(@rps.tie).to eq true
      end
      it "and computer throws paper" do
        @rps.play('rock', 'paper')
        expect(@rps.winner).to eq :computer
        expect(@rps.loser).to eq :player
        expect(@rps.tie).to eq false
      end
      it "and computer throws scissors" do
        @rps.play('rock', 'scissors')
        expect(@rps.winner).to eq :player
        expect(@rps.loser).to eq :computer
        expect(@rps.tie).to eq false
      end
    end

    describe "When player throws paper" do
      it "and computer throws rock" do
        @rps.play('paper', 'rock')
        expect(@rps.winner).to eq :player
        expect(@rps.loser).to eq :computer
        expect(@rps.tie).to eq false
      end
      it "and computer throws paper" do
        @rps.play('paper', 'paper')
        expect(@rps.winner).to eq false
        expect(@rps.loser).to eq false
        expect(@rps.tie).to eq true
      end
      it "and computer throws scissors" do
        @rps.play('paper', 'scissors')
        expect(@rps.winner).to eq :computer
        expect(@rps.loser).to eq :player
        expect(@rps.tie).to eq false
      end
    end

    describe "When player throws scissors" do
      it "and computer throws rock" do
        @rps.play('scissors', 'rock')
        expect(@rps.winner).to eq :computer
        expect(@rps.loser).to eq :player
        expect(@rps.tie).to eq false
      end
      it "and computer throws paper" do
        @rps.play('scissors', 'paper')
        expect(@rps.winner).to eq :player
        expect(@rps.loser).to eq :computer
        expect(@rps.tie).to eq false
      end
      it "and computer throws scissors" do
        @rps.play('scissors', 'scissors')
        expect(@rps.winner).to eq false
        expect(@rps.loser).to eq false
        expect(@rps.tie).to eq true
      end
    end

  end
end