class Chart < ActiveRecord::Base
  has_many :data
  accepts_nested_attributes_for :data
  def charts_gem_options
    {
      title: title.to_sym,
      background_color: background_color.to_sym,
      columns: columns,
      grouplabels: grouplabels.to_sym,
      height: height,
      width: width,
      item_height: item_height,
      item_width: item_width,
      file_type: file_type.to_sym,
      style: style.to_sym
    }
  end
end
