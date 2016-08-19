class AddColumnsToTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :booking_id, :integer
    add_column :tickets, :passenger_id, :integer
  end
end
