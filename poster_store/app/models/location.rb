#Team No:11
#Date of submission: 6/6/2014
#To store addresses of various store locations
class Location < ActiveRecord::Base
 geocoded_by :address
 after_validation :geocode
end
