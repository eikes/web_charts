class ChartsController < ApplicationController
  include ChartHelper
  before_action :find_chart, only: [:edit, :update, :show]

  def new 
    @chart = Chart.new
  end

  def create
    @chart = Chart.new(chart_params)
    if @chart.save
      redirect_to @chart
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @chart.update(chart_params)
      redirect_to @chart
    else
      render 'edit'
    end
  end

  def show
    graph_data_value = @chart.data.value


    @belonging_data = Datum.all.select { |datum| datum.chart_id == @chart.id }
    graph_data = @belonging_data.each_with_object([]) { |data, arr| arr.push data.value }
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
      :data_attributes => [:id, :value, :color, :label]
    )
  end

  def find_chart
    @chart = Chart.find(params[:id])
  end

end
