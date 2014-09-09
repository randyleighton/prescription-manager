class DrugsController < ApplicationController

  def index
    @drugs = Drug.all
  end

  def new
    @drug = Drug.new
  end

  def create
    @drug = Drug.new(params[:drug])
    if @drug.save
      flash[:notice] = "Created Successfully."
      redirect_to drugs_path
    else
      render 'new'
    end
  end


  def edit

  end


  def update
  end

  def destroy

  end

end
