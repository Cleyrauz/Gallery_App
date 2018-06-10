require_relative('../db/sql_runner')
require_relative('artist')

require('pry')

class Exhibit

  attr_reader :id
  attr_accessor :title, :date, :artist_id

  def initialize( options )
    @id = options['id'].to_i
    @title = options['title']
    @date = options['date'].to_i
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO exhibits
    (
      title,
      date,
      artist_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING *"
    values = [@title, @date, @artist_id]
    exhibit_data = SqlRunner.run(sql, values)
    @id = exhibit_data.first()['id'].to_i
  end

  def update()
   sql = "UPDATE exhibits
   SET
   (
     title,
     date,
     artist_id
   ) =
   (
     $1, $2, $3
   )
   WHERE id = $4"
   values = [@title, @date, @artist_id, @id]
   SqlRunner.run( sql, values )
 end

   def self.delete_all()
     sql = "DELETE FROM exhibits;"
     SqlRunner.run(sql)
   end

   def delete()
      sql = "DELETE FROM exhibits
      WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
    end

    def self.all()
      sql = "SELECT * FROM exhibits"
      exhibits = SqlRunner.run( sql )
      result = exhibits.map { |exhibit| Exhibit.new( exhibit) }
      return result
    end

    def self.find( id )
      sql = "SELECT * FROM exhibits WHERE id = $1"
      value = [id]
      exhibit = SqlRunner.run(sql, value)
      result = Exhibit.new( exhibit.first )
      return result
    end

    def assing_exhibit_to_an_artist( id )
      sql = "UPDATE exhibits
      SET artist_id = $1
      WHERE id = $2"
      values = [id, @id]
      SqlRunner.run( sql, values )
    end

end
