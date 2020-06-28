require 'bundler/setup'
require "sinatra/activerecord"
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
  song_id INTEGER,
  genre_id INTEGER
  )
SQL

ActiveRecord::Base.connection.execute(sql2)
