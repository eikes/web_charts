class ImageController < ApplicationController

  def new
  end

  def create_image
    data = params[:image_params][:data]
    o = params[:image_params]
    o.delete(:data)
    b = o.symbolize_keys
    options = b.each do |key, value| 
      b[key] = value.to_sym if value.is_a? String
    end
    if options[:type].eql?(:png)
      h = GraphTool::CircleCountGraph.new([22], options)
      send_data h.render, type: 'image/png', disposition: 'inline'
    elsif options[:type].eql?(:svg)
      r = GraphTool::CircleCountGraph.new([22], options)
      render text: r.render
    else
      raise
    end
  end

  # def image_render(date_me)
  #   if options[:file_format].eql?('png')
  #     send_data h.render, type: 'image/png', disposition: 'inline'
  #   elsif options[:file_format].eql?('svg')
  #     render text: r.render
  #   else
  #     raise
  #   end
  # end

  # def graph
  #   if type == :txt
  #     GraphTool::SymbolCountGraph.new(data, graph_options)
  #   elsif [:svg, :png, :jpg, :gif].include? type
  #     if style == :circle
  #       GraphTool::CircleCountGraph.new(data, graph_options)
  #     elsif style == :cross
  #       GraphTool::CrossCountGraph.new(data, graph_options)
  #     elsif style == :manikin
  #       GraphTool::ManikinCountGraph.new(data, graph_options)
  #     elsif style == :bar
  #       GraphTool::BarChart.new(data, graph_options)
  #     end
  #   end
  # end
end
