require_relative('../db/sql_runner')

require('pry')

class Artist

  attr_reader :id
  attr_accessor :name, :style, :image

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @style = options['style']
    @image = options['image']
  end

  def save()
    sql = "INSERT INTO artists
    (
      name,
      style,
      image
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING *"
    values = [@name, @style, @image]
    artist_data = SqlRunner.run(sql, values)
    @id = artist_data.first()['id'].to_i
  end

  def update()
   sql = "UPDATE artists
   SET
   (
     name,
     style,
     image
   ) =
   (
     $1, $2, $3
   )
   WHERE id = $4"
   values = [@name, @style, @image, @id]
   SqlRunner.run( sql, values )
 end

 def self.delete_all()
   sql = "DELETE FROM artists;"
   SqlRunner.run(sql)
 end

 def delete()
    sql = "DELETE FROM artists
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run( sql )
    result = artists.map { |artist| Artist.new( artist ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM artists WHERE id = $1"
    value = [id]
    artist = SqlRunner.run(sql, value)
    result = Artist.new( artist.first )
    return result
  end

end
