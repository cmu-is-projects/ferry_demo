module Contexts
  module InstructorContexts
    def create_instructors
      @mark   = FactoryGirl.create(:instructor)
      @alex   = FactoryGirl.create(:instructor, first_name: "Alex", phone: "412-268-2323", bio: nil)
      @rachel = FactoryGirl.create(:instructor, first_name: "Rachel", bio: nil, active: false, phone: "4122682324")
    end

    def delete_instructors
      @mark.delete
      @alex.delete
      @rachel.delete
    end

    def create_more_instructors
      @mike     = FactoryGirl.create(:instructor, first_name: "Mike", last_name: "Ferraco", bio: "A stupendous chess player as you have ever seen.")
      @patrick  = FactoryGirl.create(:instructor, first_name: "Patrick", last_name: "Dustmann", bio: "A stupendous chess player as you have ever seen.")
      @austin   = FactoryGirl.create(:instructor, first_name: "Austin", last_name: "Bohn", bio: "A stupendous chess player as you have ever seen.")
      @nathan   = FactoryGirl.create(:instructor, first_name: "Nathan", last_name: "Hahn", bio: "A stupendous chess player as you have ever seen.")
      @ari      = FactoryGirl.create(:instructor, first_name: "Ari", last_name: "Rubinstein", bio: "A stupendous chess player as you have ever seen.")
      @seth     = FactoryGirl.create(:instructor, first_name: "Seth", last_name: "Vargo", bio: "A stupendous chess player as you have ever seen.")
      @stafford = FactoryGirl.create(:instructor, first_name: "Stafford", last_name: "Brunk", bio: "A stupendous chess player as you have ever seen.")
      @brad     = FactoryGirl.create(:instructor, first_name: "Brad", last_name: "Hess", bio: "A stupendous chess player as you have ever seen.")
      @ripta    = FactoryGirl.create(:instructor, first_name: "Ripta", last_name: "Pasay", bio: "A stupendous chess player as you have ever seen.")
      @jon      = FactoryGirl.create(:instructor, first_name: "Jon", last_name: "Hersh", bio: "A stupendous chess player as you have ever seen.")
      @ashton   = FactoryGirl.create(:instructor, first_name: "Ashton", last_name: "Thomas", bio: "A stupendous chess player as you have ever seen.")
      @noah     = FactoryGirl.create(:instructor, first_name: "Noah", last_name: "Levin", bio: "A stupendous chess player as you have ever seen.")
    end

    def delete_more_instructors
      @mike.delete
      @patrick.delete
      @austin.delete
      @nathan.delete
      @ari.delete
      @seth.delete
      @stafford.delete
      @brad.delete
      @ripta.delete
      @jon.delete
      @ashton.delete
      @noah.delete
    end
  end
end