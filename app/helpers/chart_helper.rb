module ChartHelper
  def name_file
    file_name = { filename: @chart.title, filename_extension: @chart.file_type }
    file_name[:filename] = "web_chart_#{Time.now.strftime('%m/%d/%Y')}" if @chart.title.empty?
    file_name
  end
end
