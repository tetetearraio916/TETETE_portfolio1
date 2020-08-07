class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.image.attach(params[:post][:image])
    if @post.save
      flash[:success]="投稿しました"
      redirect_to posts_url
    else
      render 'new'
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @answer = Answer.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def delete
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to @post
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title,:content,:image)
  end
  
end
