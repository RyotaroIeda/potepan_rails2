class AddImageNameToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :image_name, :string
  end
end
