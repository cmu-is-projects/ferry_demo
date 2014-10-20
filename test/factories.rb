FactoryGirl.define do
  
  factory :curriculum do
    name "Mastering Chess Tactics"
    description "This camp is designed for any student who has mastered basic mating patterns and understands opening principles and is looking to improve his/her ability use chess tactics in game situations."
    min_rating 400
    max_rating 850
    active true
  end
  
  factory :instructor do
    first_name "Mark"
    last_name "Heimann"
    bio "Mark is currently among the top 100 players in the United States and has won 4 national scholastic chess championships."
    email { |a| "#{a.first_name}.#{a.last_name}@example.com".downcase }
    phone { rand(10 ** 10).to_s.rjust(10,'0') }
    active true
  end
  
  factory :camp do 
    cost 125
    start_date Date.new(2016,7,14)
    end_date Date.new(2016,7,18)
    time_slot "am"
    max_students 8
    active true
    association :curriculum
    association :location
  end
  
  factory :camp_instructor do 
    association :camp
    association :instructor
  end

  factory :location do
    name "Carnegie Mellon"
    street_1 "5000 Forbes Avenue"
    street_2 "Porter Hall 222"
    city "Pittsburgh"
    state "PA"
    zip "15213"
    max_capacity 16
    active true
  end
  
  factory :student do
    first_name "Ted"
    last_name "Gruberman"
    association :family
    # rating 100
    date_of_birth 10.years.ago.to_date
    active true
  end

  factory :family do
    family_name "Gruberman"
    parent_first_name "Ed"
    email { |f| "#{f.parent_first_name}.#{f.family_name}#{(1..99).to_a.sample}@example.com".downcase }
    phone { rand(10 ** 10).to_s.rjust(10,'0') }
    active true
  end

  factory :registration do
    association :camp
    association :student
    payment_status "deposit"
    points_earned 0
  end

  factory :user do
    association :instructor
    username "mheimann"
    password "secret"
    password_confirmation "secret"
    role "admin"
    active true
  end

end