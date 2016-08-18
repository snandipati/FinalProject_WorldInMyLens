#Team No:11
#Date of submission: 6/6/2014
#Handles web scraping. Parses data using Nokogiri Gem
require "rubygems"
require "nokogiri"
require "open-uri"
require "timeout"

class ScrapingController < ApplicationController
 require 'open-uri'

  def index	
      
  url_array =  ["http://www.cafepress.com/+half_dome_yosemite_national_park_square_coaster,645634824","http://www.cafepress.com/mf/30752931/tuscany-italy-_mugs?productId=542424990","http://www.cafepress.com/+lake_eola_park_fountain_orlando_ph_cocktail_shaker,1110141024","http://www.cafepress.com/+multnomah_falls_oregon_apron,469504081"]
  doc = Array.new(5)
  count = 0
  url_array.each do |url|#access the URLs
    begin	#starts the exception handling block
      doc[count] = Nokogiri::HTML(open("#{url}"))
    rescue OpenURI::HTTPError => e
      puts "Got open url: #{e}"
      abort("Error: Could not open #{url}.... [Note: Please check if its a valid url]")
    rescue SocketError => se
      puts "Got socket error: #{se}"
      abort("Error: Socket error on #{url}.... [Note: Please check on connection errors]")
    rescue StandardError=>e #executes when an exception is raised
      puts "Could not load #{url}"
      puts "Error: #{e}"
      abort("Error: Could not load #{url}.... Please check you internet connection/verify your url and refresh the broswer")
    end
    count = count + 1
  end
		
		@img1 = doc[0].xpath("//*[@id='templateimage']/@src") #get poster image using XPATH
    @img2 = doc[1].xpath("//*[@id='templateimage']/@src") #get poster image using XPATH
    @img3= doc[2].xpath("//*[@id='templateimage']/@src") #get poster image using XPATH
		@img4= doc[3].xpath("//*[@id='templateimage']/@src") #get poster image using XPATH
    
	def validate_file(filename)#validates the file existence
		if File.exist?  (filename)
			puts "Note: Valid file name : #{filename}"
		else
			puts "Note: Invalid file name : #{filename}"
			abort("ERROR : Invalid file name : #{filename} ... Exiting... [Note: Please correct the file path/name]")
		end
	end		
  end
	
end

