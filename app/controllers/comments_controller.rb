class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], tweet_id: comment_params[:tweet_id], user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to tweet_path(params[:tweet_id])  }
      format.json
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
    end
end
