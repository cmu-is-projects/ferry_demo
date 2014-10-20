namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Drop the old db and recreate from scratch
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    # Invoke rake db:migrate
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:test:prepare'].invoke
    # Need gem to make this work when adding students later: faker
    # Docs at: http://faker.rubyforge.org/rdoc/
    require 'faker'
    require 'factory_girl_rails'

    # Step 1: Create some instructors
    mark = Instructor.new
    mark.first_name = "Mark"
    mark.last_name = "Heimann"
    mark.bio = "Mark is currently among the top 100 players in the United States (USCF rating: 2449) and has won 4 national scholastic chess championships.  Mark attends Washington University in St. Louis where he majors in mathematics and economics and plays first board for the school's chess team."
    mark.email = "mark@razingrooks.org"
    mark.phone = "412-268-2323"
    mark.active = true
    mark.save!
    mark_user = User.new
    mark_user.username = "mark"
    mark_user.instructor_id = mark.id
    mark_user.password = "secret"
    mark_user.password_confirmation = "secret"
    mark_user.role = "admin"
    mark_user.save!

    alex = Instructor.new
    alex.first_name = "Alex"
    alex.last_name = "Heimann"
    alex.bio = "Alex has earned his Life Master title with a current USCF rating of 2374.  Alex has won 4 national scholastic chess championships as well as 2 national bughouse championships.  Alex attends Wheaton College in Illinios where he majors in business with a minor in anthropology and plays ultimate frisbee."
    alex.email = "alex@razingrooks.org"
    alex.phone = "412-268-3259"
    alex.active = true
    alex.save!
    alex_user = User.new
    alex_user.username = "alex"
    alex_user.instructor_id = alex.id
    alex_user.password = "secret"
    alex_user.password_confirmation = "secret"
    alex_user.role = "admin"
    alex_user.save!

    rachel = Instructor.new
    rachel.first_name = "Rachel"
    rachel.last_name = "Heimann"
    rachel.bio = "Rachel is an amazing chess player and regularly beats her brothers, Alex and Mark.  Unfortunately she is currently unable to teach for any of the chess camps at this time."
    rachel.email = "rachel@razingrooks.org"
    rachel.phone = "412-268-8211"
    rachel.active = false
    rachel.save!

    patrick = Instructor.new
    patrick.first_name = "Patrick"
    patrick.last_name = "Dustmann"
    patrick.bio = "Great TA for 67-272; hopefully can teach chess too."
    patrick.email = "patrick@razingrooks.org"
    patrick.phone = "412-268-3259"
    patrick.active = true
    patrick.save!
    patrick_user = User.new
    patrick_user.instructor_id = patrick.id
    patrick_user.username = "patrick"
    patrick_user.password = "secret"
    patrick_user.password_confirmation = "secret"
    patrick_user.role = "instructor"
    patrick_user.save!
    

    mike = Instructor.new
    mike.first_name = "Mike"
    mike.last_name = "Ferraco"
    mike.bio = "Great TA for 67-272; hopefully can teach chess too."
    mike.email = "mike@razingrooks.org"
    mike.phone = "412-268-3259"
    mike.active = true
    mike.save!
    mike_user = User.new
    mike_user.instructor_id = mike.id
    mike_user.username = "mike"
    mike_user.password = "secret"
    mike_user.password_confirmation = "secret"
    mike_user.role = "instructor"
    mike_user.save!

    nathan = Instructor.new
    nathan.first_name = "Nathan"
    nathan.last_name = "Hahn"
    nathan.bio = "Great TA for 67-272; hopefully can teach chess too."
    nathan.email = "nathan@razingrooks.org"
    nathan.phone = "412-268-3259"
    nathan.active = true
    nathan.save!
    nathan_user = User.new
    nathan_user.instructor_id = nathan.id
    nathan_user.username = "nathan"
    nathan_user.password = "secret"
    nathan_user.password_confirmation = "secret"
    nathan_user.role = "instructor"
    nathan_user.save!

    austin = Instructor.new
    austin.first_name = "Austin"
    austin.last_name = "Bohn"
    austin.bio = "Great TA for 67-272; hopefully can teach chess too."
    austin.email = "austin@razingrooks.org"
    austin.phone = "412-268-3259"
    austin.active = true
    austin.save!
    austin_user = User.new
    austin_user.instructor_id = austin.id
    austin_user.username = "austin"
    austin_user.password = "secret"
    austin_user.password_confirmation = "secret"
    austin_user.role = "instructor"
    austin_user.save!

    aegan = Instructor.new
    aegan.first_name = "Alex"
    aegan.last_name = "Egan"
    aegan.bio = "Great TA for 67-272; hopefully can teach chess too."
    aegan.email = "aegan@razingrooks.org"
    aegan.phone = "412-268-3259"
    aegan.active = true
    aegan.save!

    anthony = Instructor.new
    anthony.first_name = "Anthony"
    anthony.last_name = "Corletti"
    anthony.bio = "Great TA for 67-272; hopefully can teach chess too."
    anthony.email = "anthony@razingrooks.org"
    anthony.phone = "412-268-3259"
    anthony.active = true
    anthony.save!

    ryan = Instructor.new
    ryan.first_name = "Ryan"
    ryan.last_name = "Flood"
    ryan.bio = "Great TA for 67-272; hopefully can teach chess too."
    ryan.email = "ryan@razingrooks.org"
    ryan.phone = "412-268-3259"
    ryan.active = true
    ryan.save!

    carlos = Instructor.new
    carlos.first_name = "Carlos"
    carlos.last_name = "Diaz-Padron"
    carlos.bio = "Great TA for 67-272; hopefully can teach chess too."
    carlos.email = "carlos@razingrooks.org"
    carlos.phone = "412-268-3259"
    carlos.active = true
    carlos.save!

    lead_instructors = [mark,alex,patrick,mike,nathan,austin]
    assistants = [aegan,anthony,ryan,carlos]

    # Step 2: Create some curriculum
    beginners = Curriculum.new
    beginners.name = "Principles of Chess"
    beginners.min_rating = 0
    beginners.max_rating = 500
    beginners.description = "This camp is designed for beginning students who know need to learn opening principles, pattern recognition and basic tactics and mates.  Students will be given a set of mate-in-one flashcards and are expected to work on these at home during the week."
    beginners.active = true
    beginners.save!

    tactics = Curriculum.new
    tactics.name = "Mastering Chess Tactics"
    tactics.min_rating = 400
    tactics.max_rating = 850
    tactics.description = "This camp is designed for any student who has mastered basic mating patterns and understands opening principles and is looking to improve his/her ability use chess tactics in game situations. Students will be given a set of tactical flashcards and are expected to work on these at home during the week."
    tactics.active = true
    tactics.save!

    tal = Curriculum.new
    tal.name = "The Tactics of Mikhail Tal"
    tal.min_rating = 800
    tal.max_rating = 3000
    tal.description = "Tal is one of the most admired world champions and often called the Wizard from Riga for his almost magical play.  His chess genius was most clearly seen in his amazing sacrifices and dazzling tactics and in this camp we will dissect these thoroughly so students can learn from them."
    tal.active = false
    tal.save!

    nimzo = Curriculum.new
    nimzo.name = "Nimzo-Indian Defense"
    nimzo.min_rating = 1000
    nimzo.max_rating = 3000
    nimzo.description = "This camp is for intermediate and advanced players who are looking for a good defense to play against 1. d4.  Many world champions, including Mikhail Tal and Garry Kasparov, have played this defense with great success.  Students will have 4 to 6 games to review each day at home as homework."
    nimzo.active = true
    nimzo.save!

    endgames = Curriculum.new
    endgames.name = "Endgame Principles"
    endgames.min_rating = 750
    endgames.max_rating = 1500
    endgames.description = "In this camp we focus on mastering endgame principles and tactics.  We will focus primarily on King-pawn and King-rook endings, but other endings will be covered as well. Complete games will not be played during this camp, but students will compete through a series of endgame exercises for points and awards."
    endgames.active = true
    endgames.save!

    nonbeginner_curriculums = [tactics, nimzo, endgames]

    # Step 3: Create some locations
    north = FactoryGirl.create(:location, name: "North Side", street_1: "801 Union Place", street_2: nil, city: "Pittsburgh", zip: "15212")
    sleep 1
    cmu = FactoryGirl.create(:location) 
    sleep 1
    sqhill = FactoryGirl.create(:location, name: "Squirrel Hill", street_1: "5738 Forbes Avenue", street_2: nil, city: "Pittsburgh", zip: "15217")
    sleep 1
    acac = FactoryGirl.create(:location, name: "ACAC", street_1: "250 East Ohio St", street_2: nil, city: "Pittsburgh", zip: "15212")
    sleep 1
    all_locations = [cmu, north, sqhill, acac]

    # Step 4: Create some camps and assign to instructors
    dates = [[Date.new(2016,6,16),Date.new(2016,6,20)],
             [Date.new(2016,6,23),Date.new(2016,6,27)],
             [Date.new(2016,7,7),Date.new(2016,7,11)],
             [Date.new(2016,7,21),Date.new(2016,7,25)],
             [Date.new(2016,7,28),Date.new(2016,8,1)],
             [Date.new(2016,8,4),Date.new(2016,8,8)],
             [Date.new(2016,8,11),Date.new(2016,8,15)],
             [Date.new(2016,8,18),Date.new(2016,8,22)]]

    dates.each do |starting, ending|
      ["am","pm"].each do |slot|
        possible_locations = all_locations.clone
        possible_curriculums = nonbeginner_curriculums.clone
        first_location = possible_locations.sample
        # every session we teach a beginner's camp
        camp1 = FactoryGirl.create(:camp, curriculum: beginners, start_date: starting, end_date: ending, location: first_location, time_slot: slot)
        # assign an instructor and possibly an assistant
        possible_leads = lead_instructors.clone
        lead_instructor = possible_leads.sample
        possible_assistants = assistants.clone
        assistant = possible_assistants.sample
        lead1 = FactoryGirl.create(:camp_instructor, instructor: lead_instructor, camp: camp1)
        assistant = FactoryGirl.create(:camp_instructor, instructor: assistant, camp: camp1)

        possible_locations.delete(first_location)
        possible_leads.delete(lead_instructor)
        next_lead = possible_leads.sample
        second_location = possible_locations.sample
        curric1 = possible_curriculums.sample
        # ... and one non-beginner's camp
        camp2 = FactoryGirl.create(:camp, curriculum: curric1, start_date: starting, end_date: ending, location: second_location, time_slot: slot)
        lead2 = FactoryGirl.create(:camp_instructor, instructor: next_lead, camp: camp2)

        # about 20 percent of the time add a third camp during this session
        if rand(5).zero? 
          possible_locations.delete(second_location)
          third_location = possible_locations.sample
          possible_curriculums.delete(curric1)
          curric2 = possible_curriculums.sample
          possible_leads.delete(next_lead)
          last_lead = possible_leads.sample
          camp3 = FactoryGirl.create(:camp, curriculum: curric2, start_date: starting, end_date: ending, location: third_location, time_slot: slot)
          lead3 = FactoryGirl.create(:camp_instructor, instructor: last_lead, camp: camp3)
        end
      end
    end

    # Step 5: Create 100 families
    100.times do
      family_name = Faker::Name.last_name
      parent_first_name = Faker::Name.first_name 
      FactoryGirl.create(:family, family_name: family_name, parent_first_name: parent_first_name)
    end

    all_families = Family.all

    # Step 6: Create some students (in three blocks)
    beginner_camps = Camp.where(curriculum_id: beginners.id).chronological.all
    beginner_camps.each do |camp|
      [7,8].sample.times do
        this_family = all_families.sample
        if rand(6).zero?
            last_name = Faker::Name.last_name
        else
            last_name = this_family.family_name
        end
        first_name = Faker::Name.first_name
        dob = (5..12).to_a.sample.years.ago.to_date
        rating = (rand(2).zero? ? 0 : (100..399).to_a.sample)
        beginner_student = FactoryGirl.create(:student, family: this_family, first_name: first_name, last_name: last_name, date_of_birth: dob, rating: rating)
        payment = ["full", "deposit"].sample
        FactoryGirl.create(:registration, camp: camp, student: beginner_student, payment_status: payment)
      end
    end

    tactics_camps = Camp.where(curriculum_id: tactics.id).chronological.all
    tactics_camps.each do |camp|
      [7,8].sample.times do
        this_family = all_families.sample
        if rand(6).zero?
            last_name = Faker::Name.last_name
        else
            last_name = this_family.family_name
        end
        first_name = Faker::Name.first_name
        dob = (7..15).to_a.sample.years.ago.to_date
        rating = (525..825).to_a.sample
        tactics_student = FactoryGirl.create(:student, family: this_family, first_name: first_name, last_name: last_name, date_of_birth: dob, rating: rating)
        payment = ["full", "deposit"].sample
        FactoryGirl.create(:registration, camp: camp, student: tactics_student, payment_status: payment)
      end
    end

    nimzo_camps = Camp.where(curriculum_id: nimzo.id).chronological.all
    nimzo_camps.each do |camp|
      (5..8).to_a.sample.times do
        this_family = all_families.sample
        if rand(6).zero?
            last_name = Faker::Name.last_name
        else
            last_name = this_family.family_name
        end
        first_name = Faker::Name.first_name
        dob = (8..17).to_a.sample.years.ago.to_date
        rating = (1001..1498).to_a.sample
        nimzo_student = FactoryGirl.create(:student, family: this_family, first_name: first_name, last_name: last_name, date_of_birth: dob, rating: rating)
        payment = ["full", "deposit"].sample
        FactoryGirl.create(:registration, camp: camp, student: nimzo_student, payment_status: payment)
        # if rand(2).zero?
        #   endgame_camp = Camp.where(curriculum_id: endgames.id).openings.sample
        #   FactoryGirl.create(:registration, camp: endgame_camp, student: nimzo_student, payment_status: payment)
        # end
      end
    end

  end
end
