# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


# Skill.create(name: "driver", description:"Has current Australian drivers license")
# 5.times do 
#   Skill.create(name: Faker::Job.key_skill)
# end

# ListingOutcome.create(result:"Approved")
# ListingOutcome.create(result:"Denied")
# ListingOutcome.create(result:"Applied")
# ListingOutcome.create(result:"Being Assessed")

Skill.create(name: "Driver", description: "Has current Australian drivers license", symbol: 'car')
# Skill.create(name: "Working with childrens check", description: "Has current working with childrens check", symbol: )
# Skill.create(name: "Computer skills", description: "Has adequate computer knowledge", symbol: )
# Skill.create(name: "Food handling", description: "Has experiencing working with food", symbol: )
# Skill.create(name: "Accounting", description: "Has experience in accounting and finances", symbol: )
# Skill.create(name: "Sales", description: "Enthusiastic sales person", symbol: )
# Skill.create(name: "First Aid", description: "Up to date with first aid and CPR", symbol: )
# Skill.create(name: "Good Communication", description: "Has excellent communication skills", symbol: )
# Skill.create(name: "Languages", description: "Can speak another language other than english", symbol: )