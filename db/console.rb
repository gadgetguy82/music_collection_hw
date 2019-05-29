require("pry")
require_relative("../models/artist")
require_relative("../models/album")

Album.delete_all
Artist.delete_all

artist1 = Artist.new({"name" => "Aerosmith"})
artist1.save

artist2 = Artist.new({"name" => "Metallica"})
artist2.save

album1 = Album.new(
  {
    "title" => "Nine Lives",
    "genre" => "Rock",
    "artist_id" => artist1.id
  }
)
album1.save

album2 = Album.new(
  {
    "title" => "Get a Grip",
    "genre" => "Rock",
    "artist_id" => artist1.id
  }
)
album2.save

album3 = Album.new(
  {
    "title" => "Ride the Lightning",
    "genre" => "Metal",
    "artist_id" => artist2.id
  }
)
album3.save

binding.pry
nil
