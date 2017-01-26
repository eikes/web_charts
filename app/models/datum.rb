class Datum < ActiveRecord::Base
  belongs_to :chart
  validates :label, :value, presence: true
  validates_numericality_of :value
end
