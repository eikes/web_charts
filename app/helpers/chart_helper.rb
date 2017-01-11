module ChartHelper
  # def graph_data
  #   params[:chart][:data].to_i
  # end

  # def graph_style
  #   params[:chart][:style].to_sym
  # end

  def processing_chart_options(chart_object)
    options = chart_object.attributes.symbolize_keys
    filtered_options = validate_chart_options(options) 
    filtered_options.each do |key, value|
      filtered_options[key] = value.to_sym if value.is_a? String
    end
  end

  def validate_chart_options(options) # probably useless
    options.select do |key, _value|
      [
        :title,
        :background_color,
        :columns,
        :group_labels,
        :height,
        :width,
        :item_height,
        :item_width,
        :file_type,
        :style
      ].include? key
    end
  end
end
