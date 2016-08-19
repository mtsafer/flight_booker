class BookingsController < ApplicationController

	def new
		@flight = Flight.find_by_id params[:booking][:chosen_flight]
		@booking = @flight.bookings.build
		@passengers_count = 0
		params[:booking][:passengers].to_i.times do |p|
			@passengers_count += 1
			@booking.passengers.build
		end
		#@booking.passengers.build if params[:passengers].blank?
	end

	def create
		@booking = Booking.new(booking_params)
		if @booking.save 
			redirect_to root_path
		else
			render :new
		end
	end

	private

		def booking_params
			params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
		end

end
