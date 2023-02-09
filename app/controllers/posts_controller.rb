class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: @user.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      redirect_to user_path(current_user.id), notice: 'Post saved'
    else
      render :new, alert: 'An error occured'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @posts = Post.find(params[:id])
    @post = @user.posts.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @post.destroy
    redirect_to user_path(params[:user_id]), notice: 'Post deleted Successfully'
  end

  private

  def post_params
    params.require(:post).permit(:author, :title, :text)
  end
end
