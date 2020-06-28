require 'bundler/setup'
require "sinatra/activerecord"
require_relative '../app/models/artist.rb'
require_relative '../app/models/genre.rb'
require_relative '../app/models/song.rb'


Bundler.require

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)


sql = <<-SQL
  CREATE TABLE IF NOT EXISTS artists (
  id INTEGER PRIMARY KEY,
  name TEXT,
  song_id INTEGER,
  genre_id INTEGER
  )
SQL

ActiveRecord::Base.connection.execute(sql)

sql2 = <<-SQL
  CREATE TABLE IF NOT EXISTS genres (
  id INTEGER PRIMARY KEY,
  name TEXT,
  artist_id INTEGER,
  song_id INTEGER
  )
SQL

ActiveRecord::Base.connection.execute(sql2)

sql3 = <<-SQL
  CREATE TABLE IF NOT EXISTS songs (
  id INTEGER PRIMARY KEY,
  name TEXT,
  artist_id INTEGER,
  genre_id INTEGER
  )
SQL

ActiveRecord::Base.connection.execute(sql3)
