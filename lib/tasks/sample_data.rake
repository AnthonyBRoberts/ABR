namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
  end
end

def make_users
  User.create!(name: "Anthony Roberts",
                 email: "roberts.anthony@gmail.com",
                 password: "anthony",
                 password_confirmation: "anthony",
                 admin: true)
end

