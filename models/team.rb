require('../db/sqlrunner')

class Team

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options["id"].to_i if option["id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO teams
           (name)
           VALUES
           ($1)
           RETURN id "
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  end

end
