require 'rails_helper'

describe LedgerPrescription do

  it { should belong_to :prescription }
  it { should belong_to :ledger }
end
