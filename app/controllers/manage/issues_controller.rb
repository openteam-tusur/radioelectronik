class Manage::IssuesController < ApplicationController
  def index
    @issues = Issue.all
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.create(issue_params)
    respond_with :manage, @issue
  end

  def show
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
end
