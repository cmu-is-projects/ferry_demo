module NavigationHelpers
  def path_to(page_name)
    case page_name
 
    when /the home\s?page/
      '/'
    when /the About Us\s?page/
      about_path
    when /the Contact Us\s?page/
      contact_path
    when /the Privacy\s?page/
      privacy_path
    # curriculums
    when /the curriculums\s?page/ 
      curriculums_path
    when /the principles details\s?page/
      curriculum_path(@principles)
    when /edit the nimzo\s?page/
      edit_curriculum_path(@nimzo)    
    when /the new curriculum\s?page/
      new_curriculum_path
    # instructors
    when /the instructors\s?page/ 
      instructors_path
    when /Mike Ferraco details\s?page/
      instructor_path(@mike)
    when /edit Mike's\s?page/
      edit_instructor_path(@mike)
    when /edit Patrick's\s?page/
      edit_instructor_path(@patrick)    
    when /the new instructor\s?page/
      new_instructor_path
    # locations
    when /the locations\s?page/ 
      locations_path
    when /the CMU details\s?page/
      location_path(@cmu)
    when /edit the North Side\s?page/
      edit_location_path(@north)    
    when /the new location\s?page/
      new_location_path
    # camps
    when /the camps\s?page/ 
      camps_path
    when /the camp1 details\s?page/
      camp_path(@camp1)
    when /the camp20 details\s?page/
      camp_path(@camp20)
    when /edit camp1's\s?page/
      edit_camp_path(@camp1)  
    when /edit inactive camp's\s?page/
      edit_camp_path(@camp3)   
    when /the new camp\s?page/
      new_camp_path
    # families
    when /the camps\s?page/ 
      families_path
    when /the Hanson's\s?page/
      family_path(@hansons)
    when /edit Hanson's\s?page/
      edit_family_path(@hansons)   
    when /the new family\s?page/
      new_family_path 
    # students
    when /the students\s?page/ 
      students_path
    when /Gracie's\s?page/
      student_path(@gracie)
    when /edit Evan's\s?page/
      edit_student_path(@evan)   
    when /the new student\s?page/
      new_student_path
    # users
    when /the login page/
      login_path 
    when /edit Stafford's page/
      edit_instructor_path(@stafford) 



    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)