class Game < ActiveRecord::Base

	#home_team, away_team, location, time, week

	#  validations
	validates_datetime :time


end
