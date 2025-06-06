# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Flight.destroy_all
Airport.destroy_all


yyz = Airport.create!(airport_code: "YYZ")
cfo = Airport.create!(airport_code: "CFO")
ipl = Airport.create!(airport_code: "IPL")
kmn = Airport.create!(airport_code: "KMN")
ayz = Airport.create!(airport_code: "AYZ")

Flight.create!([
  { departure_airport: yyz, arrival_airport: kmn, date: DateTime.now + 1.day, duration: 360 },
  { departure_airport: cfo, arrival_airport: ayz, date: DateTime.now + 2.days, duration: 240 },
  { departure_airport: kmn, arrival_airport: yyz, date: DateTime.now + 3.days, duration: 180 },
  { departure_airport: ayz, arrival_airport: ipl, date: DateTime.now + 4.days, duration: 300 },
  { departure_airport: ipl, arrival_airport: cfo, date: DateTime.now + 5.days, duration: 210 }
])
