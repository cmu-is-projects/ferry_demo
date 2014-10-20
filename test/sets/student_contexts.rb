module Contexts
  module StudentContexts
    # create your contexts here...
    def create_students
      @ted    = FactoryGirl.create(:student, family: @grubermans, rating: 100)
      @zach   = FactoryGirl.create(:student, family: @skirpans, first_name: "Zach", last_name: "Skirpan", date_of_birth: 10.years.ago.to_date, rating: 1010)
      @max    = FactoryGirl.create(:student, family: @skirpans, first_name: "Max", last_name: "Skirpan", date_of_birth: 7.years.ago.to_date, rating: 535)      
      @sean   = FactoryGirl.create(:student, family: @regans, first_name: "Sean", last_name: "Regan", date_of_birth: 13.years.ago.to_date, rating: 1252)
      @kelsey = FactoryGirl.create(:student, family: @regans, first_name: "Kelsey", last_name: "Regan", date_of_birth: 11.years.ago.to_date, rating: 964)
      @peter  = FactoryGirl.create(:student, family: @regans, first_name: "Peter", last_name: "Regan", date_of_birth: 9.years.ago.to_date, rating: 842)
    end

    def delete_students
      @ted.delete
      @sean.delete
      @kelsey.delete
      @peter.delete
      @zach.delete
      @max.delete
    end

    def create_inactive_students
      # this inactive student is also set up with no rating to test default
      @ellen = FactoryGirl.create(:student, family: @regans, first_name: "Ellen", last_name: "Regan", date_of_birth: 6.years.ago.to_date, active: false)
    end

    def delete_inactive_students
      @ellen
    end

    def create_more_students
      @gracie = FactoryGirl.create(:student, family: @daigles, first_name: "Gracie", last_name: "Daigle", date_of_birth: Date.new(1998,4,4), rating: 1235)
      @maryk  = FactoryGirl.create(:student, family: @daigles, first_name: "Mary Kate", last_name: "Daigle", date_of_birth: 14.years.ago.to_date, rating: 1101)
      @evan   = FactoryGirl.create(:student, family: @schells, first_name: "Evan", last_name: "Schell", date_of_birth: Date.new(1999,12,3), rating: 1503)
      @aaron  = FactoryGirl.create(:student, family: @reays, first_name: "Aaron", last_name: "Reay", date_of_birth: 15.years.ago.to_date, rating: 1421)
      @andrew = FactoryGirl.create(:student, family: @reays, first_name: "Andrew", last_name: "Reay", date_of_birth: 9.years.ago.to_date, rating: 842)
      @ben    = FactoryGirl.create(:student, family: @santillis, first_name: "Ben", last_name: "Santilli", date_of_birth: 14.years.ago.to_date, rating: 994)
      @ryan   = FactoryGirl.create(:student, family: @santillis, first_name: "Ryan", last_name: "Santilli", date_of_birth: 12.years.ago.to_date, rating: 839)
      @alexm  = FactoryGirl.create(:student, family: @martins, first_name: "Alex", last_name: "Martin", date_of_birth: 9.years.ago.to_date, rating: 751)
      @teyah  = FactoryGirl.create(:student, family: @wilsons, first_name: "Teyah", last_name: "Wilson", date_of_birth: 7.years.ago.to_date, rating: 757)
      @lauren = FactoryGirl.create(:student, family: @gazicas, first_name: "Lauren", last_name: "Gazica", date_of_birth: 11.years.ago.to_date, rating: 0)
      @josh   = FactoryGirl.create(:student, family: @gazicas, first_name: "Josh", last_name: "Gazica", date_of_birth: 12.years.ago.to_date, rating: 379)
      @dean   = FactoryGirl.create(:student, family: @merritts, first_name: "Dean", last_name: "Merritt", date_of_birth: 10.years.ago.to_date, rating: 655)
      @keith  = FactoryGirl.create(:student, family: @merritts, first_name: "Keith", last_name: "Merritt", date_of_birth: 8.years.ago.to_date, rating: 308)
      @joylin = FactoryGirl.create(:student, family: @maclins, first_name: "Joylin", last_name: "Maclin", date_of_birth: 12.years.ago.to_date, rating: 1384)
      @hannah = FactoryGirl.create(:student, family: @hansons, first_name: "Hannah", last_name: "Hanson", date_of_birth: 11.years.ago.to_date, rating: 994)
      @sydney = FactoryGirl.create(:student, family: @hansons, first_name: "Sydney", last_name: "Hanson", date_of_birth: 14.years.ago.to_date, rating: 891, active: false)     
    end

    def delete_more_students
      @gracie.delete
      @maryk.delete
      @evan.delete
      @aaron.delete
      @andrew.delete
      @ben.delete
      @ryan.delete
      @alexm.delete
      @teyah.delete
      @lauren.delete
      @josh.delete
      @dean.delete
      @keith.delete
      @joylin.delete
      @hannah.delete
      @sydney.delete
    end
  end
end