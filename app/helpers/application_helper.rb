module ApplicationHelper
  def show_or_edit_template?(chart)
    unless chart.nil?
      chart.id.is_a? Numeric
    end
  end
end
