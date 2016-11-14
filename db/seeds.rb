require 'random_data'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Wiki.destroy_all
Collaborator.destroy_all

User.create!( email: "standard@bloc.com", password: "jjjjjj", confirmed_at: Time.now)

User.create!( email: "admin@bloc.com", password: "jjjjjj",role: "admin", confirmed_at: Time.now)

5.times do
   User.create!( email: Faker::Internet.email, password: Faker::Internet.password, confirmed_at: Time.now ) 
end

User.create!( email: "premium@bloc.com", password: "jjjjjj", role: "premium", confirmed_at: Time.now)

user = User.first

Wiki.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_sentence,
        user: user
)
 
user = User.last

2.times do
   Wiki.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_sentence,
        user: user
       ) 
end

u = User.all
user = u[1]

Wiki.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_sentence,
        user: user
) 
    
puts "#{Wiki.count} wikis had been created"
puts "#{User.count} users had been created"