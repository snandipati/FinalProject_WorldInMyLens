#Team No:11
#Date of submission: 6/6/2014
class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :poster
  belongs_to :cart
  def total_price
  poster.price * quantity
  end
end
