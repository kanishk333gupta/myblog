class PostsController < ApplicationController
  # GET /posts
  def index
    @posts = Post.all
    #render :json => @posts
  end

  # GET /posts/id
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save!
      redirect_to posts_path, notice: "Post was successfully created."
    else
      render :new
    end
  end
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
