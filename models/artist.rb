require_relative('../db/sql_runner')

require('pry')

class Artist

  attr_reader :id
  attr_accessor :name, :style

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @style = options['style']
  end

  def save()
    sql = "INSERT INTO artists
    (
      name,
      style
    )
    VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@name, @style]
    artist_data = SqlRunner.run(sql, values)
    @id = artist_data.first()['id'].to_i
  end

  def update()
   sql = "UPDATE artists
   SET
   (
     name,
     style
   ) =
   (
     $1, $2
   )
   WHERE id = $3"
   values = [@name, @style, @id]
   SqlRunner.run( sql, values )
 end

 def self.delete_all()
   sql = "DELETE FROM artists;"
   SqlRunner.run(sql)
 end



end
