class PrescriptionsController < ApplicationController


  def index
    @prescriptions = Prescription.all
    @drugs = Drug.all
  end

end
