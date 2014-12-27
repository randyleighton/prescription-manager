class FillingsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_prescription, except: :index
  before_filter :find_filling, except: [:index,:new,:create]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    @fillings = Filling.all.where(user_id:current_user.id)
  end

  def new
    @filling = @prescription.filling.new
  end

  def create
    @filling = @filling.create(filling_params)
    if @filling.valid?
      redirect_to prescription_path(@prescription), notice: "#{@filling.name} created successfully."
    else
      render 'new'
    end
  end

  def show
  end

  def update
    if @filling.update_attributes(filling_params)
      redirect_to prescription_path(@prescription), notice: "Updated Successfully"
    else
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
    params.require(:filling).permit(:name, :description, :cost_not_in_dh, :cost_in_dh, :bill_to_dh, :user_id)
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