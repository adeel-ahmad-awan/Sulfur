class ServicesController < ApplicationController

  def index
    @user = current_user
    @services = @user.services
  end


  def new
    @service = Service.new
    @user = current_user
  end

  def create
    @service = Service.create(service_params)
    @user = current_user.id
    @service.user_id = @user

    respond_to do |format|
      if @service.save
        format.html { redirect_to service_path(@service), notice: 'record successfully added.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @service = Service.find(params[:id])
    @user = @service.user_id
  end


  def edit
    @service = Service.find(params[:id])
    @user = @service.user_id
  end

  def update

    @service = Service.find(params[:id])
    @user = @service.user_id

    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to service_path(@service), notice: 'record successfully updated.' }
        # format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit }
        # format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @user = @service.user_id

    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_path, notice: 'record was successfully deleted.' }
      # format.json { head :no_content }
    end
  end


  private

  def service_params
    params.require(:service).permit(:name, :description, :user_id)
  end

end
