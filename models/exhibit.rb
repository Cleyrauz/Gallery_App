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

end
