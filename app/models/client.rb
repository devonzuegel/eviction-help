class Client < ActiveRecord::Base
  belongs_to :user
  accepts_nested_attributes_for :user

  validates :telephone, numericality: true, length: { 
    is: 10,
    message: "The telephone number must be 10 digits long, including the 3-digit area code.",
  }

  before_validation do
    self.telephone = telephone.gsub(/[^0-9]/, "") if attribute_present?('telephone')
  end
  
end