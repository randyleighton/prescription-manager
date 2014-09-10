require 'rails_helper'

describe Prescription_ledger do

  it { should belong_to :prescription }
  it { should belong_to :ledger }
end
