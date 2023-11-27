unless Rails.env.production?
namespace :dev do
  desc "Drops, creates, migrates, and adds sample data to database"
  task reset: [
    :environment,
    "db:drop",
    "db:create",
    "db:migrate",
    "db:seed",
    "dev:sample_data"
  ]

  desc "Adds sample data for development environment"
  task sample_data: [
    :environment, 
    "dev:add_users",
    "dev:add_books",
    "dev:add_comments"
    ] do
    puts " done adding sample data"
  end

  task add_users: :environment do 

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
  end

  task add_books: :environment do
    50.times do |i| 

      b = Book.create(
        user_id: User.all.sample.id,
        title: Faker::Book.title,
        summary: Faker::Lorem.sentence,
        author: Faker::Book.author, 
        genre: Faker::Book.genre,
       
      )
    end 
  end 

   task add_comments: :environment do 
      puts "adding comments"
      25.times do |i|
        commentable = nil
        if i.odd?
          commentable = Comment.all.sample
        else
          commentable = Book.all.sample
        end

        c = Comment.create(
          user_id: User.all.sample.id,
          body: Faker::Movies::HarryPotter.quote,
          commentable_type: commentable.class.name, 
          commentable_id: commentable.id,
          book_id: Book.all.sample.id
        )
      end

      puts "done"
    end
  end 
end 
