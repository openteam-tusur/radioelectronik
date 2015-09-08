class Manage::IssuesController < Manage::ApplicationController
  def new
    add_breadcrumb "Список выпусков", manage_issue_path(Issue.last)
    add_breadcrumb "Новый выпуск", new_manage_issue_path
    @issue = Issue.new
  end

  def create
    @issue = Issue.create(issue_params)
    respond_with :manage, @issue
  end

  def show
    @issues = issues_collection
    @issue = Issue.find(params[:id])
  end

  def edit
    @issue = Issue.find(params[:id])
    add_breadcrumb "Список выпусков", manage_issue_path(@issue)
    add_breadcrumb "Редактировать выпуск", edit_manage_issue_path(@issue)
  end

  def update
    @issue = Issue.find(params[:id])
    @issue.update(issue_params)
    respond_with :manage, @issue
  end

  def destroy
    Issue.find(params[:id]).destroy
    redirect_to manage_issue_path(Issue.last)
  end

  private
    def issue_params
      params.require(:issue).permit(:number, :global_id, :release_at)
    end

    def issue_years
      Issue.pluck(:release_at).map(&:year).uniq
    end

    def issues_by_year(year)
      Issue.where(:release_at => Time.zone.parse("01.01.#{year}")..Time.zone.parse("31.12.#{year}"))
    end

    def issues_collection
      issue_years.inject({}){ |hash, year|
        hash[year] = issues_by_year(year)
        hash
      }
    end
end
