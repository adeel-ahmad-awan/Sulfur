class ServicesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @services = @user.services
  end


  def new
    @user = User.find(params[:user_id])
    @service = @user.services.build
  end

  def create
    @user = User.find(params[:user_id])
    @service = @user.services.build(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to user_service_path(@user, @service), notice: 'record successfully added.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @user = User.find(params[:user_id])
    @service = @user.services.find(params[:id])
  end


  def edit
    @user = User.find(params[:user_id])
    @service = @user.services.find(params[:id])
  end

  def update

    @user = User.find(params[:user_id])
    @service = @user.services.find(params[:id])

    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to user_service_path(@user, @service), notice: 'record successfully updated.' }
        # format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit }
        # format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @service = @user.services.find(params[:id])

    @service.destroy
    respond_to do |format|
      format.html { redirect_to user_services_path, notice: 'record was successfully deleted.' }
      # format.json { head :no_content }
    end
  end


  private

  def service_params
    params.require(:service).permit(:name, :description)
  end

end
