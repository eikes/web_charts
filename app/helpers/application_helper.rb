module ApplicationHelper
  def show_template?(chart)
    unless chart.nil? || chart.new_record?
      current_page?(chart_path)
    end
  end

  def edit_template?(chart)
    unless chart.nil? || chart.new_record?
      current_page?(edit_chart_path)
    end
  end
end
