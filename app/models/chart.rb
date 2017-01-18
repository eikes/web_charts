class Chart < ActiveRecord::Base
  has_many :data
  accepts_nested_attributes_for :data, reject_if: :all_blank, allow_destroy: true
  validates :data, presence: true

  after_initialize :init_defaults, :if => :new_record?
  def init_defaults
    self.background_color = '#ffffff'
    self.style = :circle
    self.file_type = :svg
  end

  def gem_params
    {
      title:            title,
      background_color: background_color,
      columns:          columns,
      grouplabels:      grouplabels.split,
      height:           height,
      width:            width,
      item_height:      item_height,
      item_width:       item_width,
      type:             file_type.to_sym,
      style:            style.to_sym,
      colors:           data.map(&:color).any?(&:present?) ? data.map(&:color) :  nil,
      labels:           data.map(&:label),
      data:             data.map(&:value)
    }.delete_if { |_key, value| value.blank? }
  end
end
