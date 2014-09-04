require 'rails_helper'

describe Drug do

  it { should validate_presence_of :name }

end
