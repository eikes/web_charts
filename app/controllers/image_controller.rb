class ImageController < ApplicationController
  def new
  end
  def create_image
    data = params[:data]
    if data[:file_format].eql?('png')
      h = GraphTool::CircleCountGraph.new([data[:icon_number].to_i], type: :png)
      send_data h.render, type: 'image/png', disposition: 'inline'
    elsif data[:file_format].eql?('svg')
      r = GraphTool::CircleCountGraph.new([[data[:icon_number].to_i])
      render text: r.render
    else
      raise
    end
  end
end
