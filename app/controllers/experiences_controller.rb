class ExperiencesController < ApplicationController

  def index
    @user = current_user
    @experiences = @user.experiences
  end


  def new
    @experience = Experience.new
    @user = current_user
  end

  def create
    @experience = Experience.create(experience_params)
    @user = current_user.id
    @experience.user_id = @user

    respond_to do |format|
      if @experience.save
        format.html { redirect_to experiences_path, notice: 'experience was successfully added.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
      @experience = Experience.find(params[:id])
      @user = @experience.user_id
  end


  def edit
    @experience = Experience.find(params[:id])
    @user = @experience.user_id
  end

  def update

    @experience = Experience.find(params[:id])
    @user = @experience.user_id

    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to experience_path(@experience), notice: 'record successfully updated.' }
        # format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit }
        # format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @experience = Experience.find(params[:id])
    @user = @experience.user_id

    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_path, notice: 'record was successfully deleted.' }
      # format.json { head :no_content }
    end
  end


  private

  def experience_params
    params.require(:experience).permit(:company_name, :company_location, :position, :description, :from, :to, :user_id)
  end

end
