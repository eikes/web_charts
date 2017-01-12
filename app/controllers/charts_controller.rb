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
    chart = Charts::Dispatcher.new(@chart.chart_gem_params).chart
    # if chart.type.eql?(:png)
    send_data chart.render, type: Mime[chart.type], disposition: 'inline'
    # elsif chart.type.eql?(:svg)
    #   render text: chart.render
    # else
    #   raise
    # end
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
