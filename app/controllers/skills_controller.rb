class SkillsController < ApplicationController

  def index
    @user = current_user
    @skills = @user.skills
  end


  def new
    @skill = Skill.new
    @user = current_user
  end

  def create
    @skill = Skill.create(skill_params)
    @user = current_user.id
    @skill.user_id = @user

    respond_to do |format|
      if @skill.save
        format.html { redirect_to skills_path, notice: 'record was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @skill = Skill.find(params[:id])
    @user = @skill.user_id
  end

  def update

    @skill = Skill.find(params[:id])
    @user = @skill.user_id

    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to skills_path, notice: 'record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @user = @skill.user_id

    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_path, notice: 'record was successfully deleted.' }
    end
  end


  private

  def skill_params
    params.require(:skill).permit(:name, :catagory, :level, :user_id, :user_id)
  end

end
# end class
