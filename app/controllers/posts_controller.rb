class PostsController < ApplicationController
  def index
    @posts = Post.all.order(updated_at: :desc).page(params[:page]).per(5)  
  end

  def new
    @post = Post.new
  end

  def create   
    @post = Post.create(post_params)  
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
    @comments = @post.comments
    if user_signed_in?
      @comment = current_user.comments.new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)  
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to user_path(current_user.id)
  end

  private
    def post_params
      params.require(:post).permit(:text, :image).merge(user_id: current_user.id)
    end
end
