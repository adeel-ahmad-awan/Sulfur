class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def show
    @user = current_user
    @exp = @user.experiences.sort_by &:to
    @edu = @user.educations.sort_by &:to
    @ser = @user.services
    @tes = @user.testimonials
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :description, :mission, :profile_picture])
  end

end
