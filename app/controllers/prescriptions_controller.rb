class PrescriptionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_prescription, except: [:index, :new, :create]
  
  def index
    @prescriptions = Prescription.all.where(user_id:current_user.id)
    @drugs = Drug.all.where(user_id:current_user.id)
  end

  def new
    @drugs = Drug.all.where(user_id:current_user.id)
    if !@drugs.any?
      redirect_to drugs_path, notice: 'Create drugs to use in your prescriptions'
    end
    @prescription = Prescription.new
  end

  def create
    @prescription = Prescription.new(prescription_params)
    if @prescription.save
      flash[:notice] = "#{@prescription.drug.name} prescription created successfully."
      redirect_to prescriptions_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @prescription.update_attributes(prescription_params)
      redirect_to prescription_path(@prescription), notice: "Prescription updated successfully."
    else
      render 'edit', notice: "Failed to Update."
    end
  end

  def show
    @fillings = @prescription.fillings.all
  end

  def destroy
    @prescription.destroy
      flash[:notice] = "Successful"
    redirect_to prescriptions_path
  end

private

  def prescription_params
    params.require(:prescription).permit(:drug_id, :drug_uom, :renewal_interval, :quantity_prescribed,:user_id)
  end
  
  def find_prescription
    @prescription = Prescription.find(params[:id])
  end

end
