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
