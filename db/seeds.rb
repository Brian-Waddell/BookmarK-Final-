# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# TODO: change to real email
 #User.create(email: "brianwddll2@gmail.com", username: "brian", password: "password")

 
     names = ["brian", "alice", "bob", "calvin"]
 
     names.each do |name|
       u = User.create(
         email: "#{name}@example.com",
         username: name,
         password: "password"
       )
       puts "added #{u.email}"
     end
     puts "done"
   
 
 
     100.times do |i| 
 
       b = Book.create(
         user_id: User.all.sample.id,
         title: Faker::Book.title,
         summary: Faker::TvShows::TheOffice.quote,
         author: Faker::Book.author, 
         genre: Faker::Book.genre,
        
        
       )
     end 

       puts "adding comments"
       250.times do |i|
         commentable = nil
         if i.odd?
           commentable = Comment.all.sample
         else
           commentable = Book.all.sample
         end
 
         c = Comment.create(
           user_id: User.all.sample.id,
           body: Faker::Movies::HarryPotter.quote || Faker::TvShows::BigBangTheory.quote,
           commentable_type: commentable.class.name, 
           commentable_id: commentable.id
         )
       end
 
       puts "done"
    
 