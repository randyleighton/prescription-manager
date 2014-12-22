class Filled_prescription < ActiveRecord::Base
before_filter :authenticate_user! 

belongs_to :prescription

end