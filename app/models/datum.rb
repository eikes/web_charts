class Datum < ActiveRecord::Base
  belongs_to :chart
  validates :value, :label, presence: true
  validates_numericality_of :value
end
