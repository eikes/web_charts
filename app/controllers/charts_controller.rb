class ChartsController < ApplicationController
  include ChartHelper

  def new 
    @chart = Chart.new
  end

  def create
    @chart = Chart.new(chart_params)
    if @chart.save
      redirect_to root_path, notice: 'chart successfully created!'
    else
      render 'new'
    end
  end

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
      :style
    )
  end

end
