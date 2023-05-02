class PostsController < ApplicationController
  # GET /posts
  def index
    @posts = Post.all
    #render :json => @posts
  end

  # GET /posts/id
  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PostPdf.new(@post)
        
       
        send_data pdf.render, filename: "Post #{@post.title}.pdf", type: 'application/pdf', disposition: 'inline' ,target: '_blank'
      end
    end
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
