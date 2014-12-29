class PharmaciesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_pharmacy, except: [:index, :new, :create]

  def index
    @pharmacies = Pharmacy.all.where(user_id:current_user.id)
  end

  def new
    @pharmacy = Pharmacy.new
  end

  def create
    @pharmacy = Pharmacy.new(pharmacy_params)
    if @pharmacy.save
      flash[:notice] = "#{@pharmacy.name} created successfully."
      redirect_to pharmacies_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @pharmacy.update_attributes(pharmacy_params)
      redirect_to pharmacy_path(@pharmacy), notice: "#{@pharmacy.name} updated successfully."
    else
      render 'edit', notice: "Failed to Update."
    end
  end

  def show
  end

  def destroy
      flash[:notice] = "Removed Successfully"
    @pharmacy.destroy
    redirect_to pharmacies_path
  end

private

  def pharmacy_params
    params.require(:pharmacy).permit(:name, :url, :phone, :street, :city, :state, :zip, :user_id)
  end

  def find_pharmacy
        @pharmacy = Pharmacy.find(params[:id])
  end

end
