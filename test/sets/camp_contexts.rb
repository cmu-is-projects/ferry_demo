module Contexts
  module CampContexts
    def create_camps
      # assumes create_curriculums prior
      @camp1 = FactoryGirl.create(:camp, curriculum: @tactics, location: @cmu)    
      @camp2 = FactoryGirl.create(:camp, curriculum: @tactics, start_date: Date.new(2016,7,21), end_date: Date.new(2016,7,25), location: @cmu)
      @camp3 = FactoryGirl.create(:camp, curriculum: @tactics, time_slot: "pm", active: false, location: @cmu)
      @camp4 = FactoryGirl.create(:camp, curriculum: @endgames, start_date: Date.new(2016,7,21), end_date: Date.new(2016,7,26), time_slot: "pm", location: @cmu)
    end

    def delete_camps
      @camp1.delete
      @camp2.delete
      @camp3.delete
      @camp4.delete
      delete_curriculums
    end

    def create_past_camps
      # assumes create_more_curriculums prior
      @camp10 = FactoryGirl.create(:camp, curriculum: @principles, start_date: Date.new(2015,6,3), end_date: Date.new(2015,6,7), time_slot: "am", location: @cmu)
      @camp11 = FactoryGirl.create(:camp, curriculum: @nimzo, start_date: Date.new(2015,6,3), end_date: Date.new(2015,6,7), time_slot: "pm", location: @north)
      @camp12 = FactoryGirl.create(:camp, curriculum: @positional, start_date: Date.new(2015,6,10), end_date: Date.new(2015,6,14), time_slot: "am", location: @north)
      @camp13 = FactoryGirl.create(:camp, curriculum: @principles, start_date: Date.new(2015,6,10), end_date: Date.new(2015,6,14), time_slot: "pm", location: @north)
      @camp10.start_date = Date.new(2013,6,3)
      @camp10.end_date = Date.new(2013,6,7)
      @camp10.save
      @camp11.start_date = Date.new(2013,6,3)
      @camp11.end_date = Date.new(2013,6,7)
      @camp11.save
      @camp12.start_date = Date.new(2013,6,10)
      @camp12.end_date = Date.new(2013,6,14)
      @camp12.save
      @camp13.start_date = Date.new(2013,6,10)
      @camp13.end_date = Date.new(2013,6,14)
      @camp13.save
    end

    def delete_past_camps
      @camp10.delete
      @camp11.delete
      @camp12.delete
      @camp13.delete
    end

    def create_upcoming_camps
      # assumes create_more_curriculums prior
      @camp20 = FactoryGirl.create(:camp, curriculum: @principles, start_date: Date.new(2016,6,2), end_date: Date.new(2016,6,6), time_slot: "am", location: @north)
      @camp21 = FactoryGirl.create(:camp, curriculum: @nimzo, start_date: Date.new(2016,6,2), end_date: Date.new(2016,6,6), time_slot: "pm", location: @cmu)
      @camp22 = FactoryGirl.create(:camp, curriculum: @positional, start_date: Date.new(2016,6,9), end_date: Date.new(2016,6,13), time_slot: "am", location: @cmu)
      @camp23 = FactoryGirl.create(:camp, curriculum: @openings, start_date: Date.new(2016,6,9), end_date: Date.new(2016,6,13), time_slot: "pm", location: @cmu)
      @camp24 = FactoryGirl.create(:camp, curriculum: @principles, start_date: Date.new(2016,6,16), end_date: Date.new(2016,6,20), time_slot: "am", location: @cmu)
      @camp25 = FactoryGirl.create(:camp, curriculum: @adv_tactics, start_date: Date.new(2016,6,16), end_date: Date.new(2016,6,20), time_slot: "pm", location: @cmu)
      @camp26 = FactoryGirl.create(:camp, curriculum: @principles, start_date: Date.new(2016,6,23), end_date: Date.new(2016,6,27), time_slot: "am", location: @cmu)
      @camp27 = FactoryGirl.create(:camp, curriculum: @nimzo, start_date: Date.new(2016,6,23), end_date: Date.new(2016,6,27), time_slot: "pm", location: @cmu)
    end

    def delete_upcoming_camps
      @camp20.delete
      @camp21.delete
      @camp22.delete
      @camp23.delete
      @camp24.delete
      @camp25.delete
      @camp26.delete
      @camp27.delete
    end
  end
end