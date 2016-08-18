#Team No:11
#Date of submission: 6/6/2014
#To store product information
class Poster < ActiveRecord::Base
	has_many  :line_items
	has_many :orders, :through => :line_items
	before_destroy :ensure_no_line_item
	
  private
	def ensure_no_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base,'Line Items present')
			return false
		end
	end
end
