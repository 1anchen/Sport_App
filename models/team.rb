require_relative('../db/sqlrunner')

class Team

  attr_reader :id, :total_game, :win, :lose, :pct
  attr_accessor :name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]

  end

  def loses()
    sql = "SELECT games.* FROM games
           INNER JOIN teams ON games.home_team_id = teams.id
           OR games.away_team_id = teams.id
           WHERE teams.id = $1"
     values = [@id]
     game_hashes = SqlRunner.run(sql, values)
     results = Game.map_item(game_hashes)
     loses = 0
     for result in results
       if result.home_team_id == @id &&
          result.home_team_score < result.away_team_score
         loses +=1
       elsif result.away_team_id == @id &&
             result.away_team_score < result.home_team_score
         loses +=1
       else
         loses +=0
       end
    end
    return loses
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

  def update()
    sql = "UPDATE teams
           SET name
           = $1
           WHERE id = $2"
    values = [@name,@id]
    SqlRunner.run(sql,values)
  end

  def wins()
    sql = "SELECT games.* FROM games
           INNER JOIN teams ON games.home_team_id = teams.id
           OR games.away_team_id = teams.id
           WHERE teams.id = $1"
     values = [@id]
     game_hashes = SqlRunner.run(sql, values)
     results = Game.map_item(game_hashes)
     wins = 0
     for result in results
       if result.home_team_id == @id &&
          result.home_team_score > result.away_team_score
         wins +=1
       elsif result.away_team_id == @id &&
             result.away_team_score > result.home_team_score
          wins +=1
       else
          wins +=0
       end
     end
     return wins
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
    return team
  end

  def self.find_all
    sql = "SELECT * FROM teams "
    result = SqlRunner.run(sql)
    team = self.map_item(result)
    return team.uniq!
  end

  def self.map_item(team_hashes)
    result = team_hashes.map{|team_hash| self.new(team_hash)}
    return result
  end
end
