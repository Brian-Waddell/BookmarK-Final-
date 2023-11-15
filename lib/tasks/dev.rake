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
  "dev:add_books"] do
    puts "sample data"
    # TODO
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
  task add_books: :environment do 
    
  end 
end 
end 
