require 'rack/test'
require_relative '../app'

def app
  Sinatra::Application
end

describe 'RPS Web Interaction' do
  include Rack::Test::Methods

  # The user should open a browser, visit http://localhost:3000/ and be presented with a form (bonus points for style / standards compliance / etc.)
  # The form should have a dropdown indicating the available signs to throw along with a button to submit their choice
  it "Index has form select throw with rock, paper, scissor options" do
    get '/'
    expect(last_response.body).to include('select name="throw"')
    expect(last_response.body).to include('option value="rock"')
    expect(last_response.body).to include('option value="paper"')
    expect(last_response.body).to include('option value="scissors"')
  end

  # The server should generate a random throw
  it "Should generate random throw" do
    post '/throw', params = { :throw => 'rock'}
    expect(last_response.body).to include('Computer Throws ROCK').
                               or include('Computer Throws PAPER').
                               or include('Computer Throws SCISSORS')
  end

  # The server should respond with a page indicating whether the user won, lost or tied based on the server's sign
  it "Should say winner, loser, tie" do
    post '/throw', params = { :throw => 'rock'}
    expect(last_response.body).to include('Win').
                               or include('lose').
                               or include('tied')
  end

  # The response should also include a New Game link so the user can try again
  it "Should have link back to index to replay" do
    post '/throw', params = { :throw => 'rock'}
    expect(last_response.body).to include('a href="/"')
  end
end
