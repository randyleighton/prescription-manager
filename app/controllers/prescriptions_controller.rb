class PrescriptionsController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

  def index
    @prescriptions = Prescription.all
    @drugs = Drug.all
  end

  def new
    @prescription = Prescription.new
  end

  def create
    @prescription = Prescription.new(prescription_params)
    if @prescription.save
       flash[:notice] = "Successful"
      redirect_to prescriptions_path
    else
      render 'new'
    end
  end

  def show
    @prescription = Prescription.find(params[:id])
  end

  def destroy
    @prescription = Prescription.find(params[:id])
    @prescription.destroy
      flash[:notice] = "Successful"
    redirect_to prescriptions_path
  end

  def prescription_params
    params.require(:prescription).permit(:drug_id, :drug_uom, :renewal_interval)
  end
  
end
