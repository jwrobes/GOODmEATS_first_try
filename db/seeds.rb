# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

bill =  "Bill Niman"
mary =  "Mary's Chicken"

bill =  Source.create(name: bill)
m = Source.create(name: mary)
ckn = Meat.create(name: "Chicken")
beef = Meat.create(name: "Beef")
mary_organic = SourceMeat.new(name: "Free Range Organic Chicken", rating: 6, meat: ckn )
mary_regular = SourceMeat.new(name: "Free Range Chicken", rating: 4, meat: ckn )
bn = SourceMeat.new(name: "Grass fed beef", rating: 6, meat: beef)
m.source_meats << mary_organic
m.source_meats << mary_regular
m.save
bill.source_meats <<  bn
bill.save
