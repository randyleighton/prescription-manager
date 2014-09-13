class User < ActiveRecord::Base

  validates_uniqueness_of :name
  has_secure_password

end