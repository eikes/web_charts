class Chart < ActiveRecord::Base
  serialize :data, JSON
  serialize :row_labels, JSON
  serialize :column_labels, JSON
  serialize :colors, JSON

  validates :data,
            :colors,
            presence: true

  # validate :data_count_matches_row_labels_count,
  #          :data_count_matches_column_labels_count,
  validate :data_count_matches_colors_count

  def data_count_matches_row_labels_count
    if data.count != row_labels.count
      errors.add :base, 'Data count does not match row_labels count'
    end
  end

  def data_count_matches_column_labels_count
    if data.first.count != column_labels.count
      errors.add :base, 'Data column count does not match column_labels count'
    end
  end

  def data_count_matches_colors_count
    if data.count != colors.count
      errors.add :base, 'Data count does not match colors count'
    end
  end


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
      height:           height,
      width:            width,
      item_height:      item_height,
      item_width:       item_width,
      columns:          item_columns,
      type:             file_type.to_sym,
      style:            style.to_sym,
      colors:           colors,
      labels:           row_labels,
      data:             style.to_sym == :bar ? data : data.map(&:first)
    }.delete_if { |_key, value| value.blank? }
  end

  def file_name
    (title.present? ? title.parameterize('_') : "chart_#{Time.zone.now.strftime('%Y_%m_%d_-_%H_%M')}") + ".#{file_type}"
  end
end
