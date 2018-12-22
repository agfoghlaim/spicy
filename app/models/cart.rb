class Cart < ApplicationRecord

  has_many :oitems, dependent: :destroy

  def add_product(product, weight)
    puts "have product #{product.id} and weight: #{weight}"
    #find the product by id
    #check if it's in this cart already and change weight 
    #if not there create a new oitem inside the cart
    the_item = oitems.find_by(product_id:product.id)
    if(the_item)

      #update needs(id, updates), seems it doent need id
      the_item.update( :weight => weight)
     
    else
      #use collection.build
      # "collection.build(attributes = {}, …) Returns one or more new objects of the collection type that have been instantiated with attributes and linked to this object through a foreign key, but have not yet been saved. Note: This only works if an associated object already exists, not if it‘s nil!"
      the_item = oitems.build(product_id:product.id, weight:weight)
    end

    return the_item
  end
end
