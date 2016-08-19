# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

	Airport.delete_all
	Flight.delete_all

	Airport.create [{code: "SEA"}, {code: "NYC"}]

	1000.times do |i|
		sfo = Airport.first
		nyc = Airport.last
		flight = Flight.new(start_time: Time.zone.now + i.hour, duration: 9)
		if(i % 2 == 0)
			flight.to_airport_id   = sfo.id
			flight.from_airport_id = nyc.id 
		else
			flight.to_airport_id   = nyc.id
			flight.from_airport_id = sfo.id
		end
		flight.save!
	end

