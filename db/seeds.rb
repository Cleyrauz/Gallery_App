require_relative('../models/artist')
require_relative('../models/exhibit')
require('pry-byebug')

Artist.delete_all()
Exhibit.delete_all()

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

exhibit1 = Exhibit.new({
 "title" => "The persistent of memory",
 "date" => 1931,
 "artist_id" => artist1.id
  })

 exhibit2 = Exhibit.new({
 "title" => "Melting watch",
 "date" => 1954,
 "artist_id" => artist1.id
 })

 exhibit3 = Exhibit.new({
  "title" => "Girl at the window",
  "date" => 1931,
  "artist_id" => artist1.id
  })

  exhibit4 = Exhibit.new({
  "title" => "Guernica",
  "date" => 1937,
  "artist_id" => artist3.id
  })

  exhibit1.save
  exhibit2.save
  exhibit3.save
  exhibit4.save

artist2.style = "Art Nouveau"
artist2.update

exhibit2.date = 1953
exhibit2.update

Artist.all
Exhibit.all

Exhibit.find(exhibit1.id)

binding.pry
artist3.delete
exhibit3.delete
