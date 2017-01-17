class Datum < ActiveRecord::Base
  belongs_to :chart
  validates :value, :label, presence: true
end
