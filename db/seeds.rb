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

# access 100 wines from Snooth directory
base = 'http://api.snooth.com/wines/?akey='
api = 'jns95qflgapvhrcl4cbbv8ixjjb3ldm45ntt4w6lajaacg0f'
wineSearch = base + api + '&q=wine' + '&xp=5' + '&n=100'
uri = URI(wineSearch)
allWines = Net::HTTP.get(uri)
parsedWines = JSON.parse(allWines)