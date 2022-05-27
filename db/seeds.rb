require "json"
require "open-uri"
require "pry-byebug"

url = "https://tmdb.lewagon.com/movie/top_rated"
movie = JSON.parse(URI.open(url).read)


puts "Clearing database..."
Movie.destroy_all

puts "Generating new movies..."
poster_base = "https://image.tmdb.org/t/p/w500"

movie["results"].each do |item|
  movie = Movie.create!(
    title: item["title"],
    overview: item["overview"],
    poster_url: "#{poster_base}/#{item['poster_path']}",
    rating: rand(0..5)
  )
end

puts "successfully created"
