#Team No:11
#Date of submission: 6/6/2014
#To store information on purchase orders
class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  PAYMENT_TYPES = [ "PayPal" , "CreditCard" ]
  CARD_TYPES = [ "Mastercard" , "Visa" , "AmericanExpress" ]
  STATES = [ "Alabama", "Alaska", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia ", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", 
 "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", 
 "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Puerto Rico", "Rhode Island", 
 "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming" ]
  validates :name, :address, :eamil, :presence => true
  validates :city, :state, :zipcode, :phone, :presence => true
  validates :name_on_card, :card_number, :cvv_code, :exp_date, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES
  validates :card_type, :inclusion => CARD_TYPES
  validates :state, :inclusion => STATES
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
