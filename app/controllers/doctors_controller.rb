class DoctorsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_doctor, except: [:index, :new, :create]

  def index
    @doctors = Doctor.all.where(user_id: current_user.id)
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctors_path, notice: "#{@doctor.name} Created Successfully"
    else
      render 'new', notice: "Failed to create"
    end
  end

  def show

  end

  def edit

  end

  def update
    if @doctor.update(doctor_params)
      redirect_to doctor_path(@doctor), notice: "#{@doctor.name} Updated Successfully"
    else
      render 'edit', notice: "Failed to Update"
    end
  end

  def destroy
    flash[:notice]= "Removed Successfully"
    @doctor.destroy
    redirect_to doctors_path
  end

private

  def doctor_params
    params.require(:doctor).permit(:name, :office_phone, :practice_name, :email, :user_id)
  end

  def find_doctor
    @doctor = Doctor.find(params[:id])
  end


end