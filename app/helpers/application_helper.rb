module ApplicationHelper
  def show_inner_list?(issues_list, issue)
    issues_list.include?(issue)
  end

  def issue_title(issue)
    "№ #{issue.number} (#{issue.global_id}) #{Russian::strftime(issue.release_at, '%d %B %Y')}"
  end
end
