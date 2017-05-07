class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @blogs = Blog.order('created_at DESC').page(params[:page]).per(5)
  end

  def show
    @comments = @blog.comments.all.order('created_at DESC')
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = current_user.blogs.new(blog_params)

    if @blog.save
      redirect_to blogs_path
    else
      render 'new'
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :category, :post)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
