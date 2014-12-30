class DrugsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_drug, except: [:index, :new, :create]

  def index
    @drugs = Drug.all.where(user_id:current_user.id)
  end

  def new
    @drug = Drug.new
  end

  def create
    @user = current_user
    @drug = Drug.new(drug_params)
    if @drug.save
      flash[:notice] = "#{@drug.name} created successfully."
      redirect_to drugs_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @drug.update_attributes(drug_params)
      redirect_to drug_path(@drug), notice: "#{@drug.name} updated successfully."
    else
      render 'edit', notice: "Failed to Update."
    end
  end

  def show
  end

  def destroy
      flash[:notice] = "Removed Successfully"
    @drug.destroy
    redirect_to drugs_path
  end

private

  def drug_params
    params.require(:drug).permit(:name, :description, :cost_not_in_dh, :cost_in_dh, :bill_to_dh, :user_id)
  end

  def find_drug
        @drug = Drug.find(params[:id])
  end

end
