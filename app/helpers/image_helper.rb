module ImageHelper

  def graph_data
    params[:image_params][:data].to_i
  end

  def graph_options
    o = params[:image_params].except(:data)
    b = o.symbolize_keys
    options = b.each do |key, value| 
      b[key] = value.to_sym if value.is_a? String
    end
  end

end
