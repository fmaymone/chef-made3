# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Plan.create!(kind: 0, title:"Plano Básico", value: 350, description: "Plano Básico com Direito a...")
Plan.create!(kind: 1, title:"Plano Profissional", value: 900, description: "Plano Profissional com Direito a...")

Tag.create!(name: "Brasileira")
Tag.create!(name: "Alemã")
Tag.create!(name: "Francesa")
Tag.create!(name: "Japonesa")
Tag.create!(name: "Italiana")