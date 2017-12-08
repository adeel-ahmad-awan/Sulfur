class SkillsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @skills = @user.skills
  end


  def new
    @user = User.find(params[:user_id])
    @skill = @user.skills.build
  end

  def create
    @user = User.find(params[:user_id])
    @skill = @user.skills.build(skill_params)

    respond_to do |format|
      if @skill.save
        format.html { redirect_to user_skills_path, notice: 'skill was successfully created.' }
        # format.json { render :show, status: :created, location: @skill }
      else
        format.html { render :new }
        # format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
    @user = User.find(params[:user_id])
    @skill = @user.skills.find(params[:id])
  end

  def update

    @user = User.find(params[:user_id])
    @skill = @user.skills.find(params[:id])

    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to user_skills_path, notice: 'skill was successfully updated.' }
        # format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit }
        # format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @skill = @user.skills.find(params[:id])

    @skill.destroy
    respond_to do |format|
      format.html { redirect_to user_skills_path, notice: 'skill was successfully deleted.' }
      # format.json { head :no_content }
    end
  end


  private

  def skill_params
    params.require(:skill).permit(:name, :catagory, :level, :user_id)
  end

end
# end class
