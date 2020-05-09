class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.status = 'published'

    if @post.save
      flash[:notice] = 'Post added!'
      redirect_to posts_path
    else
      flash[:error] = 'Failed to add post!'
      render new_post_path
    end

  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.includes(:post, :user).where('comments.post_id = ?', params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = 'Post added!'
      redirect_to post_path(@post)
    else
      flash[:error] = 'Failed to edit post!'
      render :new
    end

  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = 'Post deleted!'
      redirect_to posts_path
    else
      flash[:error] = 'Failed to delete this post!'
      render :destroy
    end
  end

  def status_change
    @post = Post.find_by_id(params[:id])
    @post.status = @post.status == 'archive' ? 'published' : 'archive'
    if @post.save!
      flash[:error] = "Archived the post"
      redirect_to posts_path
    else
      flash[:error] = "Can't archive the post"
      render post_path(@post)
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
