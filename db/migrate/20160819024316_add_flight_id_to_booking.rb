class AddFlightIdToBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :flight_id, :integer
  end
end
