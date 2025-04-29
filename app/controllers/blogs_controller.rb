class BlogsController < ApplicationController
  def index
    @blog = Blog.new
    @blogs = Blog.page(params[:page]).reverse_order
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path, notice: 'Blog was successfully created.'
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
      redirect_to @blog, notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  private

  def blog_params
    # データ投稿
    params.require(:blog).permit(:title, :body)
  end

end
