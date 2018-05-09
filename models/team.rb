require_relative('../db/sqlrunner')

class Team

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]

  end

  def loses()
    sql = "SELECT * FROM games
           WHERE
           (home_team_id = $1 AND home_team_score < away_team_score)
           OR
           (away_team_id = $1 AND away_team_score < home_team_score)"
     values = [@id]
     game_hashes = SqlRunner.run(sql, values)
     results = Game.map_items(game_hashes)
     return results
  end

  def number_of_loses()
    loses().count()
  end

  def number_of_wins()
    wins().count()
  end

  def save()
    sql = "INSERT INTO teams
           (name)
           VALUES
           ($1)
           RETURNING id "
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  # def total_game()
  #  Team.find(@id)
  #   # return team.wins + team.loses
  # end

  def update()
    sql = "UPDATE teams
           SET name
           = $1
           WHERE id = $2"
    values = [@name,@id]
    SqlRunner.run(sql,values)
  end

  def wins()
    sql = "SELECT * FROM games
           WHERE
           (home_team_id = $1 AND home_team_score > away_team_score)
           OR
           (away_team_id = $1 AND away_team_score > home_team_score)"
     values = [@id]
     game_hashes = SqlRunner.run(sql, values)
     results = Game.map_items(game_hashes)
  end

  def win_persentage
    persentage = number_of_wins().to_f / (number_of_wins().to_f + number_of_loses.to_f)
    persentage.round(2) * 100

  end

  def self.all()
    sql = "SELECT * FROM teams "
    result = SqlRunner.run(sql)
    team = self.map_item(result)
    return team
  end

  def self.delete(id)
    sql = "DELETE FROM teams WHERE id = $1"
    values = [id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all
    sql = "DELETE FROM teams"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM teams WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    team = self.map_item(result)
    return team.first()
  end



  def self.map_item(team_hashes)
    result = team_hashes.map{|team_hash| self.new(team_hash)}
    return result
  end

  def self.results(id)
    sql = "SELECT * FROM games
           WHERE home_team_id = $1
           OR away_team_id = $1"
    values = [id]
    game_hashes = SqlRunner.run(sql, values)
    results = Game.map_items(game_hashes)
  end
end
