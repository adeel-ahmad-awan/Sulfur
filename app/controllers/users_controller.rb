class UsersController < ApplicationController
  def show
    @user = current_user
    @exp = @user.experiences.sort_by &:to
    @edu = @user.educations.sort_by &:to
  end
end
