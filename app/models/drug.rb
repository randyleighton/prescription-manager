class Drug < ActiveRecord::Base

has_many :prescriptions, dependent: :destroy
belongs_to :user

validates :name, presence: true
validates :description, presence: true

scope :order_by, ->{ order(name: :asc)}

# after_save :verify_id

# private

#   def verify_id
#     if self.id == self.user.id
#       validate :name, uniqueness: true
#     end
#   end

end

