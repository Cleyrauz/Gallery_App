require_relative('../models/artist')
require('pry-byebug')

Artist.delete_all()

artist1 = Artist.new({
  "name" => "Salvador Dali",
  "style" => "Surrealism"
  })

  artist2 = Artist.new({
  "name" => "Gustav Klimt",
  "style" => "Surrealism"
  })

  artist3 = Artist.new({
  "name" => "Pablo Picasso",
  "style" => "Surrealism"
  })

artist1.save
artist2.save
artist3.save

artist2.style = "Art Nouveau"

artist3.delete

binding.pry
nil
