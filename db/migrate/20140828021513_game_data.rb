class GameData < ActiveRecord::Migration
def up
    game1 =  Game.new
    game1.week = 1
    game1.home_team = "Steelers"
    game1.away_team = "Browns"
    game1.location = "Pittsburgh, PA"
    game1.time = DateTime.new(2014, 9, 7, 13,00,00)
    game1.save!


    game2 =  Game.new
    game2.week = 2
    game2.home_team = "Ravens"
    game2.away_team = "Steelers"
    game2.location = "Baltimore, MD"
    game2.time = DateTime.new(2014, 9, 11, 20, 25,00)
    game2.save!


    game3 =  Game.new
    game3.week = 3
    game3.home_team = "Panthers"
    game3.away_team = "Steelers"
    game3.location = "Charleston, SC"
    game3.time = DateTime.new(2014, 9, 21, 20, 30,00)
    game3.save!


    game4 =  Game.new
    game4.week = 4
    game4.home_team = "Steelers"
    game4.away_team = "Buccaneers"
    game4.location = "Pittsburgh, PA"
    game4.time = DateTime.new(2014, 9, 28, 13, 00, 00)
    game4.save!


    game5 =  Game.new
    game5.week = 5
    game5.home_team = "Jaguars"
    game5.away_team = "Steelers"
    game5.location = "Jacksonville, FL"
    game5.time = DateTime.new(2014, 10, 5, 13, 00,00)
    game5.save!


    game6 =  Game.new
    game6.week = 6
    game6.home_team = "Browns"
    game6.away_team = "Steelers"
    game6.location = "Cleveland, OH"
    game6.time = DateTime.new(2014, 10, 12, 13,00,00)
    game6.save!


    game7 =  Game.new
    game7.week = 7
    game7.home_team = "Steelers"
    game7.away_team = "Texans"
    game7.location = "Pittsburgh, PA"
    game7.time = DateTime.new(2014, 10, 20, 20, 30,00)
    game7.save!


    game8 =  Game.new
    game8.week = 8
    game8.home_team = "Steelers"
    game8.away_team = "Colts"
    game8.location = "Pittsburgh, PA"
    game8.time = DateTime.new(2014, 10, 26, 16, 25,00)
    game8.save!


    game9 =  Game.new
    game9.week = 9
    game9.home_team = "Steelers"
    game9.away_team = "Ravnes"
    game9.location = "Pittsburgh, PA"
    game9.time = DateTime.new(2014, 11, 1, 20, 30, 00)
    game9.save!


    game10 =  Game.new
    game10.week = 10
    game10.home_team = "Jets"
    game10.away_team = "Steelers"
    game10.location = "New York, NY"
    game10.time = DateTime.new(2014, 11, 9, 13, 00,00)
    game10.save!


    game11 =  Game.new
    game11.week = 11
    game11.home_team = "Titans"
    game11.away_team = "Steelers"
    game11.location = "Tallahassee, TN"
    game11.time = DateTime.new(2014, 11, 17, 20, 30,00)
    game11.save!


    game12 =  Game.new
    game12.week = 12
    game12.home_team = "Steelers"
    game12.away_team = "BYE"
    game12.location = nil
    game12.time = DateTime.new(2014, 11, 24, 00, 00,00)
    game12.save!


    game13 =  Game.new
    game13.week = 13
    game13.home_team = "Steelers"
    game13.away_team = "Saints"
    game13.location = "Pittsburgh, PA"
    game13.time = DateTime.new(2014, 11, 30, 13,00,00)
    game13.save!


    game14 =  Game.new
    game14.week = 14
    game14.home_team = "Bengals"
    game14.away_team = "Steelers"
    game14.location = "Cinncinati, OH"
    game14.time = DateTime.new(2014, 12, 7, 13,00,00)
    game14.save!


    game15 =  Game.new
    game15.week = 15
    game15.home_team = "Falcons"
    game15.away_team = "Steelers"
    game15.location = "Atlanta, GA"
    game15.time = DateTime.new(2014, 12, 14, 13,00,00)
    game15.save!


    game16 =  Game.new
    game16.week = 16
    game16.home_team = "Steelers"
    game16.away_team = "Chiefs"
    game16.location = "Pittsburgh, PA"
    game16.time = DateTime.new(2014, 12, 21, 13,00,00)
    game16.save!


    game17 =  Game.new
    game17.week = 17
    game17.home_team = "Steelers"
    game17.away_team = "Bengals"
    game17.location = "Pittsburgh, PA"
    game17.time = DateTime.new(2014, 12, 28, 13,00,00)
    game17.save!



  end

  def down
    Game.delete_all
  end

end
