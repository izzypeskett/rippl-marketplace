# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'



ListingOutcome.create(result:"Approved")
ListingOutcome.create(result:"Denied")
ListingOutcome.create(result:"Applied")
ListingOutcome.create(result:"Being Assessed")

Skill.create(name: "Driver", description: "Has current Australian drivers license", symbol: 'car')
Skill.create(name: "Working with childrens check", description: "Has current working with childrens check", symbol: 'card')
Skill.create(name: "Computer skills", description: "Has adequate computer knowledge", symbol: 'computer')
Skill.create(name: "Food handling", description: "Has experiencing working with food", symbol: 'fork')
Skill.create(name: "Accounting", description: "Has experience in accounting and finances", symbol: 'accounting')
Skill.create(name: "Sales", description: "Enthusiastic sales person", symbol: 'sales')
Skill.create(name: "First Aid", description: "Up to date with first aid and CPR", symbol: 'firstaid')
Skill.create(name: "Good Communication", description: "Has excellent communication skills", symbol: 'communication')
Skill.create(name: "Languages", description: "Can speak another language other than english", symbol: 'globe')