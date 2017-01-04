class ImageController < ApplicationController
  include ImageHelper

  def new
  end

  def create_image
    image = GraphTool::CircleCountGraph.new([graph_data], graph_options)
    if graph_options[:type].eql?(:png)
      send_data image.render, type: 'image/png', disposition: 'inline'
    elsif graph_options[:type].eql?(:svg)
      render text: image.render
    else
      raise
    end
  end

end
