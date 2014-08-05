# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'net/http'
require 'rubygems'
require 'json'

#convert location format
def convert_location(region)
	if region == ''
		"location not available"
	else
		region.split(' > ').reverse.join(", ")
	end
end

# access 100 wines from Snooth directory
base = 'http://api.snooth.com/wines/?akey='
api = 'jns95qflgapvhrcl4cbbv8ixjjb3ldm45ntt4w6lajaacg0f'
wine_search = base + api + '&q=wine' + '&xp=5' + '&n=100'
uri = URI(wine_search)
all_wines = Net::HTTP.get(uri)
parsed_wines = JSON.parse(all_wines)['wines']

#access note on each wine
base_wine = 'http://api.snooth.com/wine/?akey='
wine_note = base_wine + api 

parsed_wines.each do |wine|
	wine_url = base_wine + api + '&id=' + wine['code']
	uri_note = URI(wine_url)
	wine_note = Net::HTTP.get(uri_note)
	parsed_note = JSON.parse(wine_note)['wines']
	Wine.create(name: wine['name'], location: convert_location(wine['region']), winery: wine['winery'], wine_type: wine['type'], vintage: wine['vintage'], price: wine['price'], varietal: wine['varietal'], link: wine['link'], image: wine['image'], note: parsed_note[0]['wm_notes'])
end	

