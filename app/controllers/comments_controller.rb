class CommentsController < ApplicationController
  def create
    #render plain:params.inspect
    @comment = Comment.new(comments_params)
    @comment.save
    #redirect_to :root
    #   c.user_id=current_user.id
    # c.issue_id=params[:issue_id]
    #  c.comments =params[:comments]
    #  c.save
      respond_to do |format|
       format.js
      end
  end

  def showcomments
    # @issue_id = issue_id
     #@comments = Comment.find_all_by_issue_id(parmas[:issue_id])
    # partial: 'comments/test', locals: {params:params}#
    #render palin:params.inspect
    @comments = Comment.where(:issue_id => params[:issue_id]).reverse.drop(6)
    respond_to do |format|
      format.html {render :layout => false}
    end
  end
  private
    def comments_params
    params.require(:comment).permit(:comment,:user_id,:issue_id)
  end
end
