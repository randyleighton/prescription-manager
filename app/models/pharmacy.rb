class Pharmacy < ActiveRecord::Base

  has_many :fillings
  validates :name, presence: true, uniqueness: true

end