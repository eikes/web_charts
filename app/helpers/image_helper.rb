module ImageHelper
  def graph_data
    params[:image_params][:data].to_i
  end

  def graph_style
    params[:image_params][:style].to_sym
  end

  def graph_options
    options = params[:image_params].symbolize_keys
    options.each do |key, value|
      options[key] = if [
          :item_height, 
          :item_width, 
          :width, 
          :columns
      ].include? key
      value.to_i
                     else
                       value.to_sym
                     end
    end
    validate_options(options)
  end

  def validate_options(data)
    data.select do |key, _value|
      [
        :background_color,
        :colors,
        :columns,
        :filename,
        :group_labels,
        :height,
        :item_height,
        :item_width,
        :labels,
        :title,
        :type,
        :width
      ].include? key
    end
  end
end
