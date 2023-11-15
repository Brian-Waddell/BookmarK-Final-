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
  task sample_data: [:environment, "dev:add_users"] do
    puts "Adding sample data"
    # TODO
  end
  taks add_users: :enviornment do 

    puts "Adding users"
  end 

end
