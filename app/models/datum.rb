class Datum < ActiveRecord::Base
  belongs_to :chart
  validates :value, presence: true
end
