require('pry')
require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/game')
require_relative('../models/team')


get '/game' do
  @games = Game.all
  erb ( :"games/index" )
end

get '/game/new' do
  @teams = Team.all()
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

get '/game/:id/edit' do
  @game = Game.find(params[:id])
  binding.pry
  erb( :"games/edit" )
end

post '/game/:id' do
  game = Game.new(params)
  game.update()
  redirect to "/game/#{params['id']}"
end
