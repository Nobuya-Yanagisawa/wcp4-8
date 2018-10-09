class BlogsController < ApplicationController

  def index
    @blog = Blog.new
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    blog = Blog.new(blog_params)
    if blog.save
      flash[:notice] = "Book was successfully created."
      redirect_to blog_path(blog.id)
    else
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    if blog.update(blog_params)
      flash[:notice] = "Book was successfuly updated."
      redirect_to blog_path(blog.id)
    else
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.destroy
      flash[:notice] = "Book was successfuly destroyed."
      redirect_to blogs_path
    else
    end
  end

  private
  def blog_params
  	params.require(:blog).permit(:title, :body)
  end
end
