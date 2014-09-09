require 'rails_helper'

describe Prescription do

it { should validate_presence_of :drug_uom }
it { should validate_presence_of :renewal_interval }

it { should belong_to :drug}
it { should have_many :prescription_ledger}

end
