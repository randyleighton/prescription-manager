class PrescriptionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_prescription, except: [:index, :new, :create]
  
  def index
    @prescriptions = Prescription.all.where(user_id:current_user.id).order_by
    @drugs = Drug.all.where(user_id:current_user.id).order_by
  end

  def new
    @prescription = Prescription.new
    @prescription.build_drug #build the parent drug object
    @prescription.build_doctor #build the parent doctor object
  end

  def create
    @prescription = Prescription.create(prescription_params)
    if @prescription.valid?
      flash[:notice] = "Prescription created successfully."
      redirect_to prescriptions_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @prescription.update(prescription_params)
      redirect_to prescription_path(@prescription), notice: "Prescription updated successfully."
    else
      render 'edit', notice: "Failed to Update."
    end
  end

  def show
    @fillings = @prescription.fillings.all
    @drugs = @prescription.drug
    @doctors = @prescription.doctor
  end

  def destroy
    @prescription.destroy
      flash[:notice] = "Successful"
    redirect_to prescriptions_path
  end

private

  def prescription_params
    params.require(:prescription).permit(:doctor_id, :drug_id, :drug_uom, :renewal_interval,
                                         :quantity_prescribed,:user_id,
                                         drug_attributes:[:name, :description, :user_id],
                                         doctor_attributes:[:name, :practice_name, :office_phone, :email, :user_id])
  end
  
  def find_prescription
    @prescription = Prescription.find(params[:id])
  end

end
