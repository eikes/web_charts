class Chart < ActiveRecord::Base
  has_many :data
  accepts_nested_attributes_for :data
end
