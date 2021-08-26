# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'rest-client'
require 'faker'
require 'json'

puts "---------------------------------------------------------------"
puts "-- Retrieving stuff from The Movie Db API ... -----------------"
puts "---------------------------------------------------------------"

url = "http://tmdb.lewagon.com/movie/top_rated"
img_base_url = "https://image.tmdb.org/t/p/w500"

response = RestClient.get(url)
top_movies = JSON.parse(response)["results"].first(10)
top_movies.each do |movie_hash|
  movie = Movie.new({
    title: movie_hash["original_title"],
    overview: movie_hash["overview"],
    poster_url: "#{img_base_url}#{movie_hash["poster_path"]}",
    rating: movie_hash["vote_average"],
  })
  p movie
  p movie.save
  movie.save!
end

puts "---------------------------------------------------------------"
puts "-- Finished! over to you Boss ---------------------------------"
puts "---------------------------------------------------------------"
