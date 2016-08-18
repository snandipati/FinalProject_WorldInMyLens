class CombineItemsInCart < ActiveRecord::Migration
  def change
  end
  
  def up
    #replace multiple entries for the same poster in a cart
    # with a single item
    Cart.all.each do |cart|
      #Count the number of each poster in the cart
      sums = cart.line_items.group(:poster_id).sum(:quantity)   
      sums.each do |poster_id,quantity|
        if quantity > 1
          #remove individual items
          cart.line_items.where(poster_id:poster_id).delete_all

		  #replace with a single item
          item = cart.line_items.build(poster_id:poster_id)
          item.quantity = quantity
          item.save!	  
	
        end
      end
    end
  end
end
