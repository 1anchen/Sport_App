require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/game')
require_relative('../models/team')


get '/admin/game' do
  @games = Game.all
  erb ( :"admin/games/index" )
end

get '/admin/game/new' do
  @home_teams = Team.all()
  @away_teams = Team.all()
  @games = Game.all
  erb ( :"admin/games/new")
end

post '/admin/game' do
  game = Game.new(params)
  game.save()
  redirect to '/admin/game'
end

post '/admin/game/:id/delete' do
  Game.delete(params[:id])
  redirect to '/admin/game'
end
