#Team No:11
#Date of submission: 6/6/2014

# Meet controller parses data from meetup.com public API
class MeetController < ApplicationController

require 'rubygems'
require 'openssl'
require 'net/http'
require 'rexml/document'
include REXML

def index

#SSL Key
cacert_file = "C:\\RailsInstaller\\cacert.pem"

#Easy to modify URL parameters
$base_url = "https://api.meetup.com/2/open_events.xml?zip=94101&topic=photo&text=photography&time=,6w&key=4e7d6f2b1f6aaa774a2317781a5673&page=10"

$uri = URI.parse($base_url)

http = Net::HTTP.new($uri.host, $uri.port)

# Handles server certification verification since our url is https and not http
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
http.use_ssl = true
http.cert = OpenSSL::X509::Certificate.new(File.read cacert_file)
request = Net::HTTP::Get.new($base_url)
response = http.request(request)

#DocType declaration

xml = response.body.gsub('<?xml version="1.0" encoding="UTF-8"?>','')

#Pull in for REXML
doc = Document.new xml
puts doc
@venue_name = []
@name = []
@time =[]
@event_url =[]

doc.elements.each('//items/item/venue/name') do |ele|
@venue_name << ele.text

end
doc.elements.each('//items/item/name') do |ele|
@name << ele.text
end
doc.elements.each('//items/item/time') do |ele|
@time << ele.text
end
doc.elements.each('//items/item/event_url') do |ele|
@event_url << ele.text
end

end # end of index
end
