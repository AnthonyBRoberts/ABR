FactoryGirl.define do
  factory :user do
    name     "Anthony Roberts"
    email    "roberts.anthony@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end