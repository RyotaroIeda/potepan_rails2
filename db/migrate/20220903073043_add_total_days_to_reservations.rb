class AddTotalDaysToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :total_days, :integer
  end
end
