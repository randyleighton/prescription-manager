class DrugsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @drugs = Drug.all.where(user_id:current_user.id)
  end

  def new
    @drug = Drug.new
  end

  def create
    @drug = Drug.new(drug_params)
    if @drug.save
      flash[:notice] = "#{@drug.name} created successfully."
      redirect_to drugs_path
    else
      render 'new'
    end
  end

  def show
    @drug = Drug.find(params[:id])
  end

  def destroy
    @drug = Drug.find(params[:id])
      flash[:notice] = "Successful"
    @drug.destroy
    redirect_to drugs_path
  end

private

  def drug_params
    params.require(:drug).permit(:name, :description, :cost_not_in_dh, :cost_in_dh, :bill_to_dh, :user_id)
  end

end
