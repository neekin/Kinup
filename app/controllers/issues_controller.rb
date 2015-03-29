class IssuesController < ApplicationController
  def new
    @issue = Issue.new
  end
  def create
      #render plain:issue_params.inspect
      issue = Issue.new(issue_params)
      issue.save
       # render plain:issue.inspect
      redirect_to :root
    end
  private
    def issue_params
        params.require(:issue).permit(:message,:user_id)
    end
end