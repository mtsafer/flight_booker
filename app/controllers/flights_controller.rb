class FlightsController < ApplicationController
	def flights
		@airport_options = Airport.all.map{ |a| [ a.code, a.id ] }
		@passenger_options = [[1,1],[2,2],[3,3],[4,4]]
		@time_options = Flight.all.map{ |f| [ f.start_time_formatted_without_time,
																		f.start_time_formatted_without_time ]}.uniq
		unless params[:flight].nil?
			@passengers = params[:flight][:passengers]
			zone = Time.zone.now.dst? ? "pdt" : "pst"
			@matched_flights = Flight.where("from_airport_id = ? AND to_airport_id = ?
																				AND start_time > ? AND start_time < ?",
																	params[:flight][:from], params[:flight][:to],
					DateTime.strptime("#{params[:flight][:start_time]} #{zone}",
																																	'%m/%d/%Y %Z'),
	DateTime.strptime("#{params[:flight][:start_time]} 23:59:59 #{zone}",
																												'%m/%d/%Y %H:%M:%S %Z'))
		end
	end
end
