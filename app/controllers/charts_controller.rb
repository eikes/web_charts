class ChartsController < ApplicationController
  before_action :find_chart, only: [:render_image, :edit, :update, :show, :destroy, :download]

  def index
    @charts = Chart.all
  end

  def new
    @chart = Chart.new
  end

  def create
    @chart = Chart.new(chart_params)
    if @chart.save
      redirect_to edit_chart_path(@chart)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @chart.update(chart_params)
      redirect_to edit_chart_path(@chart)
    else
      render 'edit'
    end
  end

  def show
  end

  def download
    send_data charts_gem_chart.render, {
                                         type:        Mime[charts_gem_chart.type],
                                         disposition: 'attachment',
                                         filename:    @chart.file_name
                                       }
  end

  def render_image
    send_data charts_gem_chart.render, type: Mime[charts_gem_chart.type], disposition: 'inline'
  end

  def destroy
    @chart.delete
    redirect_to charts_path, notice: 'Chart successfully deleted!'
  end

  private

  def charts_gem_chart
    @charts_gem_chart ||= Charts::Dispatcher.new(@chart.gem_params).chart
  end


  def chart_params
    result = params.require(:chart).permit(
      :title,
      :color_scheme,
      :background_color,
      :height,
      :width,
      :item_columns,
      :item_height,
      :item_width,
      :file_type,
      :style,
      column_labels: [],
      row_labels: [],
      colors: [],
      data: [column: []]
    )
    # Unfuck data, strong params can't use deal with nested arrays
    # https://github.com/rails/rails/issues/23640
    # Also use float values
    result[:data] = result[:data].map { |_, c| c[:column].map { |v| v.present? ? v.to_f : nil  } }
    result
  end

  def find_chart
    @chart = Chart.find(params[:id])
  end
end
