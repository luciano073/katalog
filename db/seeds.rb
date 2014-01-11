# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
country = Country.create!(name: "Brasil", english_name: "Brazil")
country.flag = File.open("../Brazil.png")
country.save!

country = Country.create!(name: "Canadá", english_name: "Canada")
country.flag = File.open("../Canada.png")
country.save!

country = Country.create!(name: "Chile", english_name: "Chile")
country.flag = File.open("../Chile.png")
country.save!

country = Country.create!(name: "Estados Unidos", english_name: "United States")
country.flag = File.open("../United States.png")
country.save!