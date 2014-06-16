FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :micropost do
    content "Bacon ipsum"
    user
  end

  factory :video do
  	link "https://www.youtube.com/watch?v=Pv-Do30-P8A"
  end
end