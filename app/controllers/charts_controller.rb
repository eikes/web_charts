class ChartsController < ApplicationController
  include ChartHelper
  before_action :find_chart, only: [:show]

  def new 
    @chart = Chart.new
  end

  def create
    @chart = Chart.new(chart_params)
    if @chart.save
      redirect_to @chart, notice: 'chart successfully created!'
    else
      render 'new'
    end
  end

  def show
    graph_data = 55 
    graph_options = optimize_options(@chart)
    if @chart.style.to_sym == :circle
      image = Charts::CircleCountChart.new([graph_data], graph_options)
    elsif @chart.style.to_sym == :cross
      image = Charts::CrossCountChart.new([graph_data], graph_options)
    elsif @chart.style.to_sym == :manikin
      image = Charts::ManikinCountChart.new([graph_data], graph_options)
    elsif @chart.style.to_sym == :bar
      image = Charts::BarChart.new([graph_data], graph_options)
    elsif @chart.style.to_sym == :pie
      image = Charts::PieChart.new([graph_data], graph_options)
    end
    if graph_options[:file_type].eql?(:png)
      send_data image.render, type: 'image/png', disposition: 'inline'
    elsif graph_options[:file_type].eql?(:svg)
      render text: image.render
    else
      raise
    end
  end

  private

  def chart_params
    params.require(:chart).permit(
      :title, 
      :background_color, 
      :columns, 
      :grouplabels, 
      :height, 
      :width, 
      :item_height, 
      :item_width, 
      :file_type, 
      :style,
      :data_attributes => [:label]
    )
  end

  def find_chart
    @chart = Chart.find(params[:id])
  end

end
