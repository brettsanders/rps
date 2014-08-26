require 'sinatra'
require_relative 'rps'

get '/' do
  erb :index
end

post '/throw' do
  rps = RPS.new
  rps.play(params[:throw])

  erb :game_results, locals: {
    player_move:   rps.player_move,
    computer_move: rps.computer_move,
    winner:        rps.winner.to_s,
    loser:         rps.loser.to_s,
    tie:           rps.tie
  }

end