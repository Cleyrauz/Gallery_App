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

  # def save()
  #   sql = "INSERT INTO artists
  #   (
  #     name,
  #     style
  #   )
  #   VALUES
  #   (
  #     $1, $2
  #   )
  #   RETURNING *"
  #   values = [@name, @style]
  #   artist_data = SqlRunner.run(sql, values)
  #   @id = artist_data.first()['id'].to_i
  # end

  # def update()
  #   sql = "UPDATE students
  #   SET
  #   (
  #     first_name,
  #     second_name,
  #     house_id,
  #     age
  #   ) =
  #   (
  #     $1, $2, $3, $4
  #   )
  #   WHERE id = $5"
  #   values = [@first_name, @second_name, @house_id, @age, @id]
  #   SqlRunner.run( sql, values )
  # end
  #
  # def self.delete_all()
  #   sql = "DELETE FROM students;"
  #   SqlRunner.run(sql)
  # end
  #
  # def delete()
  #   sql = "DELETE FROM students
  #   WHERE id = $1"
  #   values = [@id]
  #   SqlRunner.run( sql, values )
  # end
  #
  # def self.all()
  #   sql = "SELECT * FROM students"
  #   students = SqlRunner.run( sql )
  #   result = students.map { |student| Student.new( student ) }
  #   return result
  # end




end
