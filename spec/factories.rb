#This gets loaded by spec automatically!
FactoryGirl.define do
  factory :user do
    name  "Bugs Bunny"
    email "bb@rabbithole.com"
    password "show_me_the_carrots"
    password_confirmation "show_me_the_carrots"
  end
end
