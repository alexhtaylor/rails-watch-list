# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'cleaning up database'
Movie.destroy_all
puts 'database is clean'
puts 'creating movies'
url = "http://tmdb.lewagon.com/movie/top_rated"
movie_serialized = URI.open(url).read
top_movies = JSON.parse(movie_serialized)
i = 0
while i < 20
  puts "creating movie"
  movie = Movie.new(
    title:top_movies["results"][i]["title"],
    overview:top_movies["results"][i]["overview"],
    poster_url:top_movies["results"][i]["poster_path"],
    rating:top_movies["results"][i]["vote_average"],
   )
  movie.save
  puts movie.title
  puts movie.rating
  i += 1
end
