module Contexts
  module CampInstructorContexts
    def create_camp_instructors
      # assumes create_curriculums, create_instructors, create_camps run prior
      @mark_c1 = FactoryGirl.create(:camp_instructor, instructor: @mark, camp: @camp1)
      @mark_c2 = FactoryGirl.create(:camp_instructor, instructor: @mark, camp: @camp2)
      @mark_c4 = FactoryGirl.create(:camp_instructor, instructor: @mark, camp: @camp4)
      @alex_c1 = FactoryGirl.create(:camp_instructor, instructor: @alex, camp: @camp1)
      @alex_c2 = FactoryGirl.create(:camp_instructor, instructor: @alex, camp: @camp2)
    end

    def delete_camp_instructors
      @mark_c1.delete
      @mark_c2.delete
      @mark_c4.delete
      @alex_c1.delete
      @alex_c2.delete    
      delete_camps
      delete_instructors
    end

    def create_more_camp_instructors
      # assumes create_more_curriculums, create_more_instructors, create_past_camps, create_upcoming_camps run prior
      @mike_c10     = FactoryGirl.create(:camp_instructor, instructor: @mike, camp: @camp10)
      @mike_c12     = FactoryGirl.create(:camp_instructor, instructor: @mike, camp: @camp12)
      @mike_c13     = FactoryGirl.create(:camp_instructor, instructor: @mike, camp: @camp13)
      @brad_c11     = FactoryGirl.create(:camp_instructor, instructor: @brad, camp: @camp11)
      @ari_c12      = FactoryGirl.create(:camp_instructor, instructor: @ari, camp: @camp12)
      @patrick_c20  = FactoryGirl.create(:camp_instructor, instructor: @patrick, camp: @camp20)
      @austin_c21   = FactoryGirl.create(:camp_instructor, instructor: @austin, camp: @camp21)
      @nathan_c22   = FactoryGirl.create(:camp_instructor, instructor: @nathan, camp: @camp22)
      @ari_c23      = FactoryGirl.create(:camp_instructor, instructor: @ari, camp: @camp23)
      @seth_c24     = FactoryGirl.create(:camp_instructor, instructor: @seth, camp: @camp24)
      @stafford_c25 = FactoryGirl.create(:camp_instructor, instructor: @stafford, camp: @camp25)
      @ashton_c25   = FactoryGirl.create(:camp_instructor, instructor: @ashton, camp: @camp25)
      # No camps assigned to noah, jon, ripta
      # No instructors for camps 26 (principles) and 27 (nimzo) [and camp3 (tactics) earlier]
    end

    def delete_more_camp_instructors
      @mike_c10.delete
      @mike_c12.delete
      @mike_c13.delete
      @brad_c11.delete
      @ari_c12.delete
      @patrick_c20.delete
      @austin_c21.delete
      @nathan_c22.delete
      @ari_c23.delete
      @seth_c24.delete
      @stafford_c25.delete
      @ashton_c25.delete
    end
  end
end