require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/game')
require_relative('../models/team')


get '/game' do
  @games = Game.all
  erb ( :"games/index" )
end

get '/game/new' do
  @home_teams = Team.all()
  @away_teams = Team.all()
  @games = Game.all
  erb ( :"games/new")
end

post '/game' do
  game = Game.new(params)
  game.save()
  redirect to '/game'
end

post '/game/:id/delete' do
  Game.delete(params[:id])
  redirect to '/game'
end
