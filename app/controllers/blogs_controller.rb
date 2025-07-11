class BlogsController < ApplicationController
  def index
    @blog = Blog.new
    @blog.build_post_image
    @blogs = Blog.page(params[:page]).reverse_order
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    # こもでるにも渡す
    @blog.post_image.user = current_user if @blog.post_image.present?
    if @blog.save
      redirect_to blogs_path, notice: '投稿できました✨'
    else
      @blogs = Blog.page(params[:page]) # 新規投稿のnill解決
      render :index
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to @blog, notice: '編集できました✨'
    else
      render :edit
    end
  end

  private

  def blog_params
    # データ投稿
    params.require(:blog).permit(:title, :body, post_image_attributes: [:image])
  end

end
