class AddCartTotalToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :cart_total, :decimal, precision: 12, scale: 2
  end
end
