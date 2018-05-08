require_relative('../db/sqlrunner')
require_relative('team')

class Game

  attr_reader :id
  attr_accessor :home_team_id, :away_team_id, :home_team_score, :away_team_score

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @home_team_id = options["home_team_id"].to_i
    @away_team_id = options["away_team_id"].to_i
    @home_team_score = options["home_team_score"].to_i
    @away_team_score = options["away_team_score"].to_i
    extra_time()
  end

  def away_team_name()
    sql = "SELECT teams.name
           FROM games
           INNER JOIN teams
           ON away_team_id = teams.id
           WHERE games.id =$1"
    values = [@id]
    result = SqlRunner.run(sql,values)
    team_name = result[0]['name']
  end

  def home_team_name()
    sql = "SELECT teams.name
           FROM games
           INNER JOIN teams
           ON home_team_id = teams.id
           WHERE games.id =$1"
    values = [@id]
    result = SqlRunner.run(sql,values)
    team_name = result[0]['name']
  end

  def extra_time()
    score1 = rand(1..10)
    if @home_team_score == @away_team_score
       @home_team_score += (score1+2)
       @away_team_score += score1
    end
  end

  def save()
    sql = "INSERT INTO games
          (home_team_id,away_team_id,home_team_score,away_team_score)
          VALUES
          ($1,$2,$3,$4)
          RETURNING id"
    values = [@home_team_id,@away_team_id,@home_team_score,@away_team_score]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id']
  end



  def update()
    sql = "UPDATE games
           SET (home_team_id, away_team_id, home_team_score, away_team_score)
           = ($1,$2,$3,$4)
           WHERE id = $5"
    values = [@home_team_id, @away_team_id, @home_team_score, @away_team_score, @id]
    SqlRunner.run(sql,values)
  end


  def self.delete(id)
    sql = "DELETE FROM games WHERE id = $1"
    values = [id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all
    sql = "DELETE FROM games"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM games WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    game = self.map_items(result)
    return game.first()
  end

  def self.all
    sql = "SELECT * FROM games"
    result = SqlRunner.run(sql)
    game = self.map_items(result)
    return game
  end

  def self.league_table
    teams = Team.all
    league = []
    teams.sort_by {|team| [team.win_persentage, team.name]}

    for team in teams
      league = league.push(team.name)
    end
    return league
  end

  def self.map_items(game_hashes)
    result = game_hashes.map{|game_hash| self.new(game_hash)}
    return result
  end
end
