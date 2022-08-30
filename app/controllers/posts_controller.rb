class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save!
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[id])
    if @post.update(post_params)
      flash[:success] = "Your post successfully updated!"
      redirect_to post_url(@post)
    else
      flash.now[:error] = "Your post was not updated!"
      render :edit
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to post_path, status: :see_other

  private

  def post_params
    params.require(:post).permit(:headline, :description, :solved, :photo)
  end
end
