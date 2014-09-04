class DrugsController < ApplicationController

  def index
    @drugs = Drug.all
  end

  def new
    @drug = Drug.new

  end

  def create

  end


  def edit

  end


  def update
  end

  def destroy

  end

end
