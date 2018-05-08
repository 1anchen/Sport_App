require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/team')

get '/my_teams' do
  @teams = Team.all
  erb(:"my_teams/index")
end
