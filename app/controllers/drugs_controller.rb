class DrugsController < ApplicationController
#   before_filter :authorize, only: [:index, :edit, :update]

  def index
    @drugs = Drug.all
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

  def drug_params
    params.require(:drug).permit(:name, :description, :cost_not_in_dh, :cost_in_dh, :bill_to_dh)
  end

end
