class Flight < ApplicationRecord
	belongs_to :to_airport, class_name: :Airport
	belongs_to :from_airport, class_name: :Airport

	has_many :bookings
	has_many :passengers, through: :bookings

	def start_time_formatted_with_time
    start_time.strftime("%m/%d/%Y -- %l:%M %P")
  end
  def start_time_formatted_without_time
    start_time.strftime("%m/%d/%Y")
  end
end
