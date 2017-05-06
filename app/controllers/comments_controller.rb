class CommentsController < ApplicationController
  before_action :set_blog, only: [:new, :edit, :update, :create, :destroy]
  before_action :set_comment, only: [:edit, :update]

  def index
    @comments = Blog.find(params[:id]).Comment.all
  end

  def show
  end

  def new
    @comment = @blog.comments.build
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to blog_path(@blog)
    else
      render 'edit'
    end
  end

  def create
    @comment = @blog.comments.new(comment_params)

    if @comment.save
      redirect_to blog_path(@blog)
    else
      render 'new'
    end

  end

  def destroy
    @blog.comments.find(params[:id]).destroy
    redirect_to blog_path(@blog)
  end

  private

  def comment_params
    params.require(:comment).permit(:remark, :email, :user)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end
end
