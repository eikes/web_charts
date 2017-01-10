class ImagesController < ApplicationController
  include ImageHelper

  def new 
  end

  def create
    if graph_style == :circle
      image = Charts::CircleCountChart.new([graph_data], graph_options)
    elsif graph_style == :cross
      image = Charts::CrossCountChart.new([graph_data], graph_options)
    elsif graph_style == :manikin
      image = Charts::ManikinCountChart.new([graph_data], graph_options)
    elsif graph_style == :bar
      image = Charts::BarChart.new([graph_data], graph_options)
    elsif graph_style == :pie
      image = Charts::PieChart.new([graph_data], graph_options)
    end
    if graph_options[:type].eql?(:png)
      send_data image.render, type: 'image/png', disposition: 'inline'
    elsif graph_options[:type].eql?(:svg)
      render text: image.render
    else
      raise
    end
  end

end
