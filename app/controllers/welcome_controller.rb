class WelcomeController < ApplicationController
  def index
    @user = current_user
    @exp = @user.experiences.sort_by &:to
    @edu = @user.educations.sort_by &:to
    @ser = @user.services
    @tes = @user.testimonials
  end

  def about
  end
end
