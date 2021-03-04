class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to root_path
    else
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      redirect_to edit_post_path(@post.id)
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:text, :image).merge(user_id: current_user.id)
    end
end
