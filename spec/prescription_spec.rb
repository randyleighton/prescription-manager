require 'rails_helper'

describe Prescription do

it { should validate_presence_of :drug_uom }
it { should validate_presence_of :quantity }
it { should validate_presence_of :cost_not_in_dh }
it { should validate_presence_of :cost_in_dh }
it { should validate_presence_of :bill_to_dh }
it { should validate_presence_of :date }

it { should belong_to :drug}

end
