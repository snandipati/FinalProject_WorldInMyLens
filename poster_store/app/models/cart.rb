#Team No:11
#Date of submission: 6/6/2014
class Cart < ActiveRecord::Base
has_many :line_items, dependent: :destroy
def add_poster(poster_id)#adds the posters by poster_id to cart
		current_item = line_items.find_by(poster_id: poster_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(poster_id: poster_id)
		end
		current_item
	end
def total_price#gives the total price of added items
		line_items.to_a.sum {|item| item.total_price}	
	end

 end
