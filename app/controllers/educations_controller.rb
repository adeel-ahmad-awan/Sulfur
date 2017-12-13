class EducationsController < ApplicationController

  def index
    @user = current_user
    @educations = @user.educations
  end


  def new
    @education = Education.new
    @user = current_user
  end

  def create
    @education = Education.create(education_params)
    @user = current_user.id
    @education.user_id = @user

    respond_to do |format|
      if @education.save
        format.html { redirect_to education_path(@education), notice: 'record successfully added.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @education = Education.find(params[:id])
    @user = @education.user_id
  end


  def edit
    @education = Education.find(params[:id])
    @user = @education.user_id
  end

  def update

    @education = Education.find(params[:id])
    @user = @education.user_id

    respond_to do |format|
      if @education.update(education_params)
        format.html { redirect_to education_path(@education), notice: 'record successfully updated.' }
        # format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit }
        # format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @education = Education.find(params[:id])
    @user = @education.user_id

    @education.destroy
    respond_to do |format|
      format.html { redirect_to educations_path, notice: 'record was successfully deleted.' }
      # format.json { head :no_content }
    end
  end
  #
  #
  private

  def education_params
    params.require(:education).permit(:institute, :degree, :description, :from, :to, :user_id)
  end

end
