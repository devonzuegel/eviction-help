class Case < ActiveRecord::Base
  has_many :plaintiffs, class_name: 'Client'
  has_many :attorneys
end
