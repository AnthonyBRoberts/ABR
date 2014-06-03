namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Anthony Roberts",
                 email: "roberts.anthony@gmail.com",
                 password: "anthony",
                 password_confirmation: "anthony",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@gmail.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end