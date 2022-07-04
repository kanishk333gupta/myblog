class CommentsController < ApplicationController
  # GET /posts
  def index
    @post=Post.find(params["post_id"])
    puts params["post_id"]
    @comments=@post.comments
    #render :json => @posts
  end

  # GET /posts/id
  def show
    @comment = Comment.find(params[:id])
  end
  def new
    @comment=Comment.new
  end
  # def create
  #   @comment = Comment.new(post_params)
  #   if @comment.save
  #     redirect_to posts_path, notice: "Post was successfully created."
  #   else
  #     render :new
  #   end
  # end
  # def post_params
  #   params.require(:post).permit(:title, :body)
  # end
end