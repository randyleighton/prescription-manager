class PrescriptionsController < ApplicationController

  def index
    @prescriptions = Prescription.all
    @drugs = Drug.all
  end

  def new
    @prescription = Prescription.drug.new
  end

  def create
    @drug = Prescription.new(params[:prescription])
    if @drug.save
      flash[:notice] = "Created Successfully."
      redirect_to prescriptions_path
    else
      render 'new'
    end
  end

  def show
    @prescription = Prescription.find([:id])
  end

  def destroy
    @prescription = Prescription.find([:id])
    @prescription.destroy
    flash[:notice] = "Removed Successfully."
    redirect_to prescriptions_path
  end

end
