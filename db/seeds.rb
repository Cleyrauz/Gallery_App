require_relative('../models/artist')
require_relative('../models/exhibit')
require('pry-byebug')

Artist.delete_all()
Exhibit.delete_all()

  artist1 = Artist.new({
  "name" => "Salvador Dali",
  "style" => "Surrealism",
  "image" => "/images/Dali.jpeg"
  })

  artist2 = Artist.new({
  "name" => "Gustav Klimt",
  "style" => "Surrealism",
  "image" => "/images/Klimt.jpeg"
  })

  artist3 = Artist.new({
  "name" => "Pablo Picasso",
  "style" => "Surrealism",
  "image" => "/images/picasso.jpeg"
  })

artist1.save
artist2.save
artist3.save

exhibit1 = Exhibit.new({
 "title" => "The persistence of memory",
 "date" => 1931,
 "artist_id" => artist1.id,
 "category" => "Surrealism",
 "image" => "/images/the_persistence_of_memory.jpeg"
  })

 exhibit2 = Exhibit.new({
 "title" => "Melting watch",
 "date" => 1954,
 "artist_id" => artist1.id,
 "category" => "Surrealism",
 "image" => "/images/the_melting_watch.jpeg"
 })

 exhibit3 = Exhibit.new({
  "title" => "Girl at the window",
  "date" => 1931,
  "artist_id" => artist3.id,
  "category" => "Surrealism",
  "image" => "/images/girl_at_the_window.jpeg"
  })

  exhibit4 = Exhibit.new({
  "title" => "Guernica",
  "date" => 1937,
  "artist_id" => artist3.id,
  "category" => "Surrealism",
  "image" => "/images/guernica.jpeg"
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
Artist.find(artist2.id)
exhibit1.assing_exhibit_to_an_artist(artist1.id)
exhibit1.find_exhibit_by_artist(artist1.id)

binding.pry
artist3.delete
exhibit3.delete
