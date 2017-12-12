class TestimonialsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @tes = @user.testimonials
  end

  def show
    @user = User.find(params[:user_id])
    @tes = @user.testimonials.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @tes = @user.testimonials.build
  end

  def create
    @user = User.find(params[:user_id])
    @tes = @user.testimonials.build(testimonial_params)

    respond_to do |format|
      if @tes.save
        format.html { redirect_to user_testimonial_path(@user, @tes), notice: 'skill was successfully created.' }
        # format.json { render :show, status: :created, location: @tes }
      else
        format.html { render :new }
        # format.json { render json: @tes.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
    @user = User.find(params[:user_id])
    @tes = @user.testimonials.find(params[:id])
  end

  def update

    @user = User.find(params[:user_id])
    @tes = @user.testimonials.find(params[:id])

    respond_to do |format|
      if @tes.update(testimonial_params)
        format.html { redirect_to user_testimonial_path(@user, @tes), notice: 'skill was successfully created.' }
        # format.json { render :show, status: :ok, location: @tes }
      else
        format.html { render :edit }
        # format.json { render json: @tes.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @tes = @user.testimonials.find(params[:id])

    @tes.destroy
    respond_to do |format|
      format.html { redirect_to user_testimonials_path(@user), notice: 'skill was successfully created.' }
      # format.json { head :no_content }
    end
  end


  private

  def testimonial_params
    params.require(:testimonial).permit(:persons_name, :persons_designantion, :description, :company, :pic)
  end

end
