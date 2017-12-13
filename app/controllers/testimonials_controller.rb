class TestimonialsController < ApplicationController

  def index
    @user = current_user
    @tes = @user.testimonials
  end

  def new
    @tes = Testimonial.new
    @user = current_user
  end

  def create
    @tes = Testimonial.create(testimonial_params)
    @user = current_user.id
    @tes.user_id = @user

    respond_to do |format|
      if @tes.save
        format.html { redirect_to testimonial_path(@tes), notice: 'skill was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @tes = Testimonial.find(params[:id])
    @user = @tes.user_id
  end

  def edit
    @tes = Testimonial.find(params[:id])
    @user = @tes.user_id
  end

  def update

    @tes = Testimonial.find(params[:id])
    @user = @tes.user_id

    respond_to do |format|
      if @tes.update(testimonial_params)
        format.html { redirect_to testimonial_path(@tes), notice: 'record was successfully created.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @tes = Testimonial.find(params[:id])
    @user = @tes.user_id

    @tes.destroy
    respond_to do |format|
      format.html { redirect_to testimonials_path, notice: 'record was successfully created.' }
    end
  end


  private

  def testimonial_params
    params.require(:testimonial).permit(:persons_name, :persons_designantion, :description, :company, :pic, :user_id)
  end

end
