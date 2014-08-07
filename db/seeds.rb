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

def get_json(url, str)
	uri = URI(url)
	all_wines = Net::HTTP.get(uri)
	JSON.parse(all_wines)[str]
end

def get_color(wine_type)
	color = ''
	if wine_type == 'Red Wine'
		color = '#96281B'
	elsif wine_type == 'White Wine'
		color = '#F2F1EF'
	elsif wine_type == 'Sparkling Wine'   
		color = '#FDE3A7'
	elsif wine_type == 'Specialty Wines'
		color = '#22A7F0'
	elsif wine_type == 'Fortified Wines'
		color = '#913D88'	
	end
	color
end

# access 100 wines from Snooth directory
base = 'http://api.snooth.com/wines/?akey='
api = 'jns95qflgapvhrcl4cbbv8ixjjb3ldm45ntt4w6lajaacg0f'
wine_search = base + api + '&q=wine' + '&xp=5' + '&n=100'
parsed_wines = get_json(wine_search, 'wines')


#access note on each wine
base_wine = 'http://api.snooth.com/wine/?akey='
wine_note = base_wine + api 

parsed_wines.each do |wine|
	wine_url = base_wine + api + '&id=' + wine['code']
	parsed_note = get_json(wine_url, 'wines')
	Wine.create(name: wine['name'], location: convert_location(wine['region']), winery: wine['winery'], wine_type: wine['type'], wine_color: get_color(wine['type']), vintage: wine['vintage'], price: wine['price'], varietal: wine['varietal'], link: wine['link'], image: wine['image'], note: parsed_note[0]['wm_notes'])
end	

# access 100 wines from LCBO api
url = 'http://lcboapi.com/products?q=wine&per_page=100'
parsed_wines2 = get_json(url, 'result')

parsed_wines2.each do |wine|
	Wine.create(name: wine['name'], location: wine['origin'], winery: wine['producer_name'], wine_type: wine['secondary_category'], wine_color: get_color(wine['secondary_category']), vintage: wine['released_on'], price: wine['price_in_cents'], varietal: wine['varietal'], image: wine['image_url'], note: wine['tasting_note'])
end

