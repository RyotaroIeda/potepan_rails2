class AddPriceToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :price, :integer
  end
end
