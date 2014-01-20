# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
country = Country.create!(name: "Brasil", english_name: "Brazil")
country.flag = File.open("public/images/Brazil.png")
country.save!

country = Country.create!(name: "Canadá", english_name: "Canada")
country.flag = File.open("public/images/Canada.png")
country.save!

country = Country.create!(name: "Chile", english_name: "Chile")
country.flag = File.open("public/images/Chile.png")
country.save!

country = Country.create!(name: "Estados Unidos", english_name: "United States")
country.flag = File.open("public/images/United States.png")
country.save!

country = Country.create!(name: "França", english_name: "France")
country.flag = File.open("public/images/France.png")
country.save!

country = Country.create!(name: "Alemanha", english_name: "Germany")
country.flag = File.open("public/images/Germany.png")
country.save!

country = Country.create!(name: "India", english_name: "India")
country.flag = File.open("public/images/India.png")
country.save!

country = Country.create!(name: "Irlanda", english_name: "Ireland")
country.flag = File.open("public/images/Ireland.png")
country.save!

country = Country.create!(name: "Itália", english_name: "Italy")
country.flag = File.open("public/images/Italy.png")
country.save!

country = Country.create!(name: "Japão", english_name: "Japan")
country.flag = File.open("public/images/Japan.png")
country.save!

country = Country.create!(name: "México", english_name: "Mexico")
country.flag = File.open("public/images/Mexico.png")
country.save!

country = Country.create!(name: "África do Sul", english_name: "South Africa")
country.flag = File.open("public/images/South Africa.png")
country.save!

country = Country.create!(name: "Coreia do Sul", english_name: "South Korea")
country.flag = File.open("public/images/South Korea.png")
country.save!

country = Country.create!(name: "Espanha", english_name: "Spain")
country.flag = File.open("public/images/Spain.png")
country.save!

country = Country.create!(name: "Reino Unido", english_name: "United Kingdom")
country.flag = File.open("public/images/United Kingdom.png")
country.save!

country = Country.create!(name: "Líbano", english_name: "Lebanon")
country.flag = File.open("public/images/Lebanon.png")
country.save!

country = Country.create!(name: "Israel", english_name: "Israel")
country.flag = File.open("public/images/Israel.png")
country.save!

country = Country.create!(name: "Áustria", english_name: "Austria")
country.flag = File.open("public/images/Austria.png")
country.save!

country = Country.create!(name: "Australia", english_name: "Australia")
country.flag = File.open("public/images/Australia.png")
country.save!

Profession.create!(name: "Ator")
Profession.create!(name: "Diretor(a)")
Profession.create!(name: "Roteirista")
Profession.create!(name: "Atriz")
Profession.create!(name: "Produtor(a)")
Profession.create!(name: "Escritor(a)")
Profession.create!(name: "Desenhista")
Profession.create!(name: "Cantor(a)")
Profession.create!(name: "Modelo")
