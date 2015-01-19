class FillingsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_prescription, except: :index
  before_filter :find_filling, except: [:index,:new,:create]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    @fillings = Filling.all.where(user_id:current_user.id)
  end

  def new
    @filling = @prescription.fillings.new
    @filling.build_pharmacy
  end

  def create
    @filling = @prescription.fillings.create(filling_params)
    if @filling.valid?
      redirect_to prescription_path(@prescription), notice: "Filling on #{@filling.date_filled} created successfully."
    else
      render 'new'
    end
  end

  def show
    @drug = Drug.find(@prescription.drug_id)
    @pharmacy = Pharmacy.find(@filling.pharmacy_id)
  end

  def update
    if @filling.update(filling_params)
      redirect_to prescription_path(@prescription), notice: "Updated Successfully"
    else
      binding.pry
      render 'edit', notice: "Failed to Update"

    end
  end

  def destroy
    @filling.destroy
    flash[:notice] = "Filling for #{@prescription} removed"
    redirect_to prescription_path(@prescription)
  end

private

  def filling_params
    params.require(:filling).permit(:prescription_id, :date_filled, :medicare_paid, :price_paid, 
                   :user_id, :pharmacy_id, pharmacy_attributes:[:name, :url, :phone, :user_id])
  end

  def find_prescription
    @prescription = Prescription.find(params[:prescription_id])
  end

  def find_filling
    @filling = @prescription.fillings.find(params[:id])
  end

  def not_found
    session[:return_to]||= root_url
    redirect_to session[:return_to], flash: {alert: 'Problem finding record, you might not be authorized.'}
  end

end