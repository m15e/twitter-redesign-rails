class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.source_id = params[:source_id]
    @comment.user_id = current_user

    if @comment.save
      redirect_to request.referrer, notice: 'Comment was successfully created.'
    else
      redirect_to request.referrer, alert: @comment.errors.full_messages.join('. ').to_s
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
