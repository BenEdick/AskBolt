class PostsController < ApplicationController

  def index
    @posts = Post.all

    if current_user.present?
      @myposts = Post.find_all_by_user_id(current_user.id)
    else

    end
    @recentposts = Post.order("created_at DESC").page(params[:page]).per(4)
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])

  end

  def new
    @post = Post.new

  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = 'Post was successfully updated.'
      redirect_to posts_url
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  private
  def post_params
    params.require(:post).permit(:post)
  end

end
