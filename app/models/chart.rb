class Chart < ActiveRecord::Base
  has_many :data
  accepts_nested_attributes_for :data, reject_if: :all_blank, allow_destroy: true
  validates :data, presence: true

  def gem_params
    {
      title: title,
      background_color: background_color,
      columns: columns,
      grouplabels: grouplabels.split,
      height: height,
      width: width,
      item_height: item_height,
      item_width: item_width,
      type: file_type.to_sym,
      style: style.to_sym,
      colors: data.map(&:color),
      labels: data.map(&:label),
      data: data.map(&:value)
    }
  end

end
