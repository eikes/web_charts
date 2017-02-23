class Chart < ActiveRecord::Base
  has_many :data
  accepts_nested_attributes_for :data, allow_destroy: true
  validates :data, presence: true

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
      colors:           data.map(&:color).any?(&:present?) ? data.map(&:color) : nil,
      labels:           data.map(&:label),
      data:             style.to_sym == :bar ? data.map { |datum| [datum.value] } : data.map(&:value)
    }.delete_if { |_key, value| value.blank? }
  end
end
