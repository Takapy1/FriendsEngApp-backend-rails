# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
(1..10).each do |_s|
  Season.create
end

transcripts_path= Rails.root.to_s + "/public/transcripts"
(1..10).each do |season_id|
  html_file_names = Dir.open(transcripts_path+ "/html/season#{season_id}").children
  num_episodes = html_file_names.size
  num_episodes.times.map{ Episode.create(season_id: season_id) }
end