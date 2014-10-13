module Contexts
  module FamilyContexts
    # create your contexts here...
    def create_families
      @grubermans = FactoryGirl.create(:family)
      @skirpans   = FactoryGirl.create(:family, family_name: "Skirpan", parent_first_name: "Ellen")
      @regans     = FactoryGirl.create(:family, family_name: "Regan", parent_first_name: "Patrick", phone: "412-369-4314")

    end

    def delete_families
      @grubermans.delete
      @regans.delete
      @skirpans.delete
    end

    def create_inactive_families
      @ellis = FactoryGirl.create(:family, family_name: "Ellis", parent_first_name: "Carolyn", active: false)
    end

    def delete_inactive_families
      @ellis.delete
    end

    def create_more_families
      @daigles   = FactoryGirl.create(:family, family_name: "Daigle", parent_first_name: "Elizabeth", phone: "412-268-2323")
      @schells   = FactoryGirl.create(:family, family_name: "Schell", parent_first_name: "Diane")
      @reays     = FactoryGirl.create(:family, family_name: "Reay", parent_first_name: "Deb")
      @santillis = FactoryGirl.create(:family, family_name: "Santilli", parent_first_name: "Tammy")
      @martins   = FactoryGirl.create(:family, family_name: "Martin", parent_first_name: "Andy")
      @wilsons   = FactoryGirl.create(:family, family_name: "Wilson", parent_first_name: "Kristin")
      @gazicas   = FactoryGirl.create(:family, family_name: "Gazica", parent_first_name: "Beth")
      @merritts  = FactoryGirl.create(:family, family_name: "Merritt", parent_first_name: "Karen")
      @dances    = FactoryGirl.create(:family, family_name: "Dance", parent_first_name: "Chanelle")            
      @fowlers   = FactoryGirl.create(:family, family_name: "Fowler", parent_first_name: "Maureen")
      @maclins   = FactoryGirl.create(:family, family_name: "Maclin", parent_first_name: "Nancy")
      @hansons   = FactoryGirl.create(:family, family_name: "Hanson", parent_first_name: "Melissa", phone: "412-268-3259")
    end    

    def delete_more_families
      @daigles.delete
      @schells.delete
      @reays.delete
      @santillis.delete
      @martins.delete
      @wilsons.delete
      @gazicas.delete
      @merritts.delete
      @dances.delete          
      @fowlers.delete
      @maclins.delete
      @hansons.delete
    end   
  end
end