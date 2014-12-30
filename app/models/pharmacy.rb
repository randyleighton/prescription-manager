class Pharmacy < ActiveRecord::Base

  validates :name, presence: true
  has_many :fillings
  belongs_to :user

  before_save :external_link

private

  def external_link
    if self.url!= nil && !self.url.include?("http://")
      self.url.insert(0,"http://")
    end
  end

end