require("pry")
require_relative("../models/artist")
require_relative("../models/album")

Album.delete_all
Artist.delete_all

artist1 = Artist.new({"name" => "Aerosmith"})
artist1.save

album1 = Album.new(
  {
    "title" => "Nine Lives",
    "genre" => "Rock",
    "artist_id" => @artist1
  }
)
album1.save

binding.pry
nil
