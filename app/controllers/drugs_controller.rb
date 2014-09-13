class DrugsController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

  def index
    @drugs = Drug.all
  end

  def new
    @drug = Drug.new
  end

  def create
    @drug = Drug.new(params[:drug])
    if @drug.save
      flash[:notice] = "Successful"
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

end
