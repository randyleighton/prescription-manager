class Ledger_prescriptionsController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

end
