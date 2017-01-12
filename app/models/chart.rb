class Chart < ActiveRecord::Base
  has_many :data
  accepts_nested_attributes_for :data
  def chart_gem_params
    {
      title: title.to_sym,
      background_color: background_color.to_sym,
      columns: columns,
      grouplabels: grouplabels.split,
      height: height,
      width: width,
      item_height: item_height,
      item_width: item_width,
      type: file_type.to_sym,
      style: style.to_sym,
      color: data.map(&:color.to_sym),
      label: data.map(&:label.to_sym),
      data: data.map(&:value)
    }
  end

end
