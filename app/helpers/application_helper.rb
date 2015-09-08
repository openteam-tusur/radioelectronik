module ApplicationHelper
  def show_inner_list?(issues_list, issue)
    issues_list.include?(issue)
  end
end
