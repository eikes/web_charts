class Chart < ActiveRecord::Base
  has_many :data
  accepts_nested_attributes_for :data, reject_if: :all_blank, allow_destroy: true
  validates :data, presence: true

  def self.color_schemes
    {
      sequential:  %w(BuGn BuPu GnBu OrRd PuBu PuBuGn PuRd RdPu YlGn YlGnBu YlOrBr YlOrRd),
      singlehue:   %w(Blues Greens Greys Oranges Purples Reds),
      diverging:   %w(BrBG PiYG PRGn PuOr RdBu RdGy RdYlBu RdYlGn Spectral),
      qualitative: %w(Accent Dark2 Paired Pastel1 Pastel2 Set1 Set2 Set3)
    }
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
      colors:           data.map(&:color).any?(&:present?) ? data.map(&:color) : nil,
      labels:           data.map(&:label),
      data:             style.to_sym == :bar ? data.map { |datum| [datum.value] } : data.map(&:value)
    }.delete_if { |_key, value| value.blank? }
  end

  def file_name
    (title.present? ? title.parameterize('_') : "chart_#{Time.zone.now.strftime('%Y_%m_%d_-_%H_%M')}") + ".#{file_type}"
  end
end
