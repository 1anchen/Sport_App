require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/team_controller')
require_relative('controllers/game_controller')
# require_relative('controllers/bitings_controller')

get '/' do
  erb( :index )
end
