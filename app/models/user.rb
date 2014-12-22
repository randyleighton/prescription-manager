class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :prescriptions, dependent: :destroy
  has_many :fillings, through: :prescriptions
  has_many :drugs, dependent: :destroy

end
