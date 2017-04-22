# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(email:'admin@admin.com', password:'awesomeadmin123')
user2 = User.create(email:'ngofirst@ngo.com', password:'firstngo123')
user3 = User.create(email:'ngosecond@ngo.com', password:'secondngo123')
user4 = User.create(email:'john@example.com', password:'john123')
user5 = User.create(email:'bob@example.com', password:'bob123')

user1.skip_confirmation!
user2.skip_confirmation!
user3.skip_confirmation!
user4.skip_confirmation!
user5.skip_confirmation!

user1.save
user2.save
user3.save
user4.save
user5.save

user1.add_role :admin
user2.add_role :ngo
user3.add_role :ngo
user4.add_role :generaluser
user5.add_role :generaluser
