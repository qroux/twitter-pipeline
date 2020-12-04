

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    url = post_params[:official_url]
    @thumb = LinkThumbnailer.generate(url)

    raise


    if @post.save
      redirect_to root_path
    else
      flash[:alert] = "Missing field"
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(
      :title,
      :official_url,
      :official_photo,
      :opposite_url,
      :opposite_photo)
  end
end
