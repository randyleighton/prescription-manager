require 'rails_helper'

describe PrescriptionLedger do

  it { should belong_to :prescription }
  it { should belong_to :ledger }
end
