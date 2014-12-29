class Pharmacy < ActiveRecord::Base

  has_many :fillings
  validates :name, presence: true, uniqueness: true

  before_save :external_link, :reject_if => :url_blank

private

  def external_link
    if self.url!= nil && !self.url.include?("http://")
      self.url.insert(0,"http://")
    end
  end

end