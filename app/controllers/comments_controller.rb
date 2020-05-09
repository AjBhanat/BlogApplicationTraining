class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
    redirect_to posts_path
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to post_path(params[:post_id])
    else
      redirect_to post_path(params[:post_id])
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update
      redirect_to post_path(params[:post_id])
    else
      render edit_post_comment_path(@comment)
    end

  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to post_path(params[:post_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:description)
  end

end
