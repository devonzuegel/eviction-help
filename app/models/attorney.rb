class Attorney < ActiveRecord::Base
  belongs_to :user
  accepts_nested_attributes_for :user
  has_many :clients
end