# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_role = Role.create(name: "admin")
delivery_role = Role.create(name: "delivery")

User.create(email: "email@email.com", password: "asdf1234", password_confirmation: "asdf1234", role: admin_role)
User.create(email: "delivery@email.com", password: "asdf1234", password_confirmation: "asdf1234", role: delivery_role)
