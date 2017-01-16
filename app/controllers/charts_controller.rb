class ChartsController < ApplicationController
  include ChartHelper
  before_action :find_chart, only: [:edit, :update, :show, :destroy]

  def index
    @charts = Chart.all
  end

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
    @charts_gem_chart = Charts::Dispatcher.new(@chart.gem_params).chart
    send_data @charts_gem_chart.render, type: Mime[@charts_gem_chart.type], disposition: 'inline'
  end


  def destroy
    @chart.delete
    redirect_to charts_path, notice: 'Chart successfully deleted!'
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
      data_attributes: [:id, :value, :color, :label, :_destroy]
    )
  end

  def find_chart
    @chart = Chart.find(params[:id])
  end
end
