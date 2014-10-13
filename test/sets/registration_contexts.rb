module Contexts
  module RegistrationContexts
    # create your contexts here...
    def create_paid_registrations
      @max_tactics    = FactoryGirl.create(:registration, camp: @camp1, student: @max, payment_status: "full")
      @peter_endgames = FactoryGirl.create(:registration, camp: @camp4, student: @peter, payment_status: "full")
      @peter_tactics  = FactoryGirl.create(:registration, camp: @camp1, student: @peter, payment_status: "full")
    end

    def delete_paid_registrations
      @max_tactics.delete
      @peter_endgames.delete
      @peter_tactics.delete
    end

    def create_deposit_registrations
      @zach_endgames  = FactoryGirl.create(:registration, camp: @camp4, student: @zach)
      @kelsey_endgames = FactoryGirl.create(:registration, camp: @camp4, student: @kelsey)
    end

    def delete_deposit_registrations
      @zach_endgames.delete
      @kelsey_endgames.delete
    end

    def create_more_registrations
      @gracie_endgames   = FactoryGirl.create(:registration, camp: @camp4, student: @gracie)
      @maryk_endgames    = FactoryGirl.create(:registration, camp: @camp4, student: @maryk)
      @gracie_nimzo      = FactoryGirl.create(:registration, camp: @camp21, student: @gracie, payment_status: "full")
      @maryk_nimzo       = FactoryGirl.create(:registration, camp: @camp21, student: @maryk, payment_status: "full")
      @evan_nimzo        = FactoryGirl.create(:registration, camp: @camp21, student: @evan, payment_status: "full")
      @evan_adv_tactics  = FactoryGirl.create(:registration, camp: @camp25, student: @evan, payment_status: "full")
      @aaron_endgames    = FactoryGirl.create(:registration, camp: @camp4, student: @aaron)
      @andrew_tactics    = FactoryGirl.create(:registration, camp: @camp1, student: @andrew)
      @ben_endgames      = FactoryGirl.create(:registration, camp: @camp4, student: @ben)
      @ryan_tactics      = FactoryGirl.create(:registration, camp: @camp1, student: @ryan)
      @alexm_tactics     = FactoryGirl.create(:registration, camp: @camp1, student: @alexm)
      @teyah_tactics     = FactoryGirl.create(:registration, camp: @camp1, student: @teyah)
      @lauren_principles = FactoryGirl.create(:registration, camp: @camp20, student: @lauren)
      @josh_principles   = FactoryGirl.create(:registration, camp: @camp20, student: @josh)
      @dean_tactics      = FactoryGirl.create(:registration, camp: @camp1, student: @dean)
      @keith_principles  = FactoryGirl.create(:registration, camp: @camp20, student: @keith)
      @joylin_nimzo      = FactoryGirl.create(:registration, camp: @camp21, student: @joylin, payment_status: "full")
      @hannah_endgames   = FactoryGirl.create(:registration, camp: @camp4, student: @hannah)
    end

    def delete_more_registrations
      @gracie_endgames.delete
      @maryk_endgames.delete
      @gracie_nimzo.delete
      @maryk_nimzo.delete
      @evan_nimzo.delete
      @evan_adv_tactics.delete
      @aaron_endgames.delete
      @andrew_tactics.delete
      @ben_endgames.delete
      @ryan_tactics.delete
      @alexm_tactics.delete
      @teyah_tactics.delete
      @lauren_principles.delete
      @josh_principles.delete
      @dean_tactics.delete
      @keith_principles.delete
      @joylin_nimzo.delete
      @hannah_endgames.delete
    end
  end
end