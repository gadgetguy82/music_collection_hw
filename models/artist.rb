require_relative("../db/sql_runner")
require_relative("album")

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options["name"]
    @id = options["id"].to_i if options["id"]
  end

  def save
    sql = "INSERT INTO artists (name)
    VALUES ($1) RETURNING *"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def album_list
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    return albums.map{|album| Album.new(album)}
  end

  def self.list_all
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map{|artist| Artist.new(artist)}
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

end
