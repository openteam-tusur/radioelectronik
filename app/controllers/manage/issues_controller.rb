class Manage::IssuesController < Manage::ApplicationController
  def new
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
  end

  def update
    @issue = Issue.update(issue_params)
    respond_with :manage, @issue
  end

  def destroy

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
