require_relative('../models/artist')
require('pry-byebug')

artist1 = Artist.new({
  "name" => "Salvador Dali",
  "style" => "Surrealism"
  })

  artist2 = Artist.new({
  "name" => "Gustav Klimt",
  "style" => "Surrealism"
  })

artist1.save
artist2.save

artist2.style = "Art Nouveau"
artist2.save

binding.pry
nil
