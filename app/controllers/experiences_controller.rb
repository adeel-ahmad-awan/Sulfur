class ExperiencesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @experiences = @user.experiences
  end


  def new
    @user = User.find(params[:user_id])
    @experience = @user.experiences.build
  end

  def create
    @user = User.find(params[:user_id])
    @experience = @user.experiences.build(experience_params)

    respond_to do |format|
      if @experience.save
        format.html { redirect_to user_experiences_path, notice: 'experience was successfully added.' }
        # format.json { render :show, status: :created, location: @skill }
      else
        format.html { render :new }
        # format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
      @user = User.find(params[:user_id])
      @experience = @user.experiences.find(params[:id])
  end


  def edit
    @user = User.find(params[:user_id])
    @experience = @user.experiences.find(params[:id])
  end

  def update

    @user = User.find(params[:user_id])
    @experience = @user.experiences.find(params[:id])

    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to user_experiences_path, notice: 'skill was successfully updated.' }
        # format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit }
        # format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @experience = @user.experiences.find(params[:id])

    @experience.destroy
    respond_to do |format|
      format.html { redirect_to user_experiences_path, notice: 'experience was successfully deleted.' }
      # format.json { head :no_content }
    end
  end


  private

  def experience_params
    params.require(:experience).permit(:company_name, :company_location, :position, :description, :from, :to)
  end


end
