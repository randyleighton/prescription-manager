class Filled_prescription < ActiveRecord::Base
before_filter :authenticate_user! 
end