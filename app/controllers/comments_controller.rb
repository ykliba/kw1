class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post_id)
    else
      redirect_to post_path(@comment.post_id)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
    end
end
