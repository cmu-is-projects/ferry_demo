module Contexts
  module UserContexts
    # create your contexts here...
    def create_users
      @mark_user = FactoryGirl.create(:user, instructor: @mark)
      @alex_user = FactoryGirl.create(:user, instructor: @alex, username: "tank")
    end

    def delete_users
      @mark_user.delete
      @alex_user.delete
    end

    def create_more_users
      @mike_user    = FactoryGirl.create(:user, instructor: @mike, username: "mike", role: "instructor")
      @patrick_user = FactoryGirl.create(:user, instructor: @patrick, username: "patrick", role: "instructor")
      @austin_user  = FactoryGirl.create(:user, instructor: @austin, username: "austin", role: "instructor")
      @nathan_user  = FactoryGirl.create(:user, instructor: @nathan, username: "nathan", role: "instructor")
    end

    def delete_more_users
      @mike_user.delete
      @patrick_user.delete
      @austin_user.delete
      @nathan_user.delete
    end    
  end
end