# require needed files
require './test/sets/curriculum_contexts'
require './test/sets/instructor_contexts'
require './test/sets/camp_contexts'
require './test/sets/camp_instructor_contexts'
require './test/sets/location_contexts'
require './test/sets/family_contexts'
require './test/sets/student_contexts'
require './test/sets/registration_contexts'
require './test/sets/user_contexts'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::CurriculumContexts
  include Contexts::InstructorContexts
  include Contexts::CampContexts
  include Contexts::CampInstructorContexts
  include Contexts::LocationContexts
  include Contexts::FamilyContexts
  include Contexts::StudentContexts
  include Contexts::RegistrationContexts
  include Contexts::UserContexts
end