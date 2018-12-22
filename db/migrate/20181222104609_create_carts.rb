class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.string :status
      t.string :billing
      t.string :shipping

      t.timestamps
    end
  end
end
