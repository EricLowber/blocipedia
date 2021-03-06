 require 'faker'
 
 # Create Wikis
 # Create Users
 15.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: "helloworld",
     role: ['member', 'premium_member'].sample,   
     # password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all


 50.times do
   Wiki.create!(
     user:   users.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph     
   )

 end
 wikis = Wiki.all
 
 # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
   )
 admin.skip_confirmation!
 admin.save!

 #create fake user
 lowber = User.new(
  name:       'lowber',
  email:      'lowber@example.com',
  password:   'helloworld',
  role:       'member'
  )
 lowber.skip_confirmation!
 lowber.save!



  


 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
 puts "#{User.count} users created" 


