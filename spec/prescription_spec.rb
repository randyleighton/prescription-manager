require 'rails_helper'

describe Prescription do

it { should validate_presence_of :drug_uom }

it { should belong_to :drug}

end
