 require 'faker'
 
 # Create Wikis
 50.times do
   Wiki.create!(
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

 # Create Members
 10.times do 
  member = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    # role:     'member'
   )
  member.skip_confirmation!
  member.save!
 end

 users = User.all

 # Create Premium Member
  premium_member = User.new(
    name:     'Premium Member',
    email:    'premium@example.com',
    password: 'helloworld',
    role:     'premium_member'
   )
  premium_member.skip_confirmation!
  premium_member.save!
 
  

 #Create Collaborations
 10.times do
  collaboration = Collaboration.create!(
    user: users.sample,
    wiki: wikis.sample,
   )
  end

 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
 puts "#{User.count} users created" 
 puts "#{Collaboration.count} collaborations created"

