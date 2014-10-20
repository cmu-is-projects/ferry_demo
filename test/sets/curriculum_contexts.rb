module Contexts
  module CurriculumContexts
    def create_curriculums
      @tactics    = FactoryGirl.create(:curriculum)
      @endgames   = FactoryGirl.create(:curriculum, name: "Endgame Principles", min_rating: 700, max_rating: 1500)
      @smithmorra = FactoryGirl.create(:curriculum, name: "Smith-Morra Gambit", active: false)
    end

    def delete_curriculums
      @tactics.delete
      @endgames.delete
      @smithmorra.delete
    end

    def create_more_curriculums
      @tal         = FactoryGirl.create(:curriculum, name: "The Tactics of Tal", min_rating: 850, max_rating: 1500, description: "All about the tacicts of Tal.", active: false)
      @nimzo       = FactoryGirl.create(:curriculum, name: "Nimzo-Indian Defense", min_rating: 1000, max_rating: 3000, description: "All about the Nimzo-Indian Defense.")
      @principles  = FactoryGirl.create(:curriculum, name: "Principles of Chess", min_rating: 0, max_rating: 500, description: "All about the basic principles of chess.")
      @positional  = FactoryGirl.create(:curriculum, name: "Positional Understanding", min_rating: 1000, max_rating: 1800, description: "All about positional understanding in chess.")
      @adv_tactics = FactoryGirl.create(:curriculum, name: "Advanced Tactics Training", min_rating: 1000, max_rating: 3000, description: "All about advanced tactical training.")
      @openings    = FactoryGirl.create(:curriculum, name: "Chess Opening for Beginners", min_rating: 0, max_rating: 600, description: "All about the opening for beginners.")
    end

    def delete_more_curriculums
      @tal.delete
      @nimzo.delete
      @principles.delete
      @positional.delete
      @adv_tactics.delete
      @openings.delete
    end
  end
end