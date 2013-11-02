class PostsController < ApplicationController

before_filter :find_post,  only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    #render text: @categs.map{ |i| "#{i.name}"}.join("<br/>")
  end

  def show
    unless @post
      render text: "Page not found", status: 404
    end
  end


  def new
    @post = Post.new
  end


  def edit

  end

  def create
    #@categ = Category.create(category_param)
    #render text: " #{@categ.id} : #{@categ.name}  (#{!@categ.new_record?})"
    #render text: params.inspect
    @post = Post.create(post_param)
    if @post.errors.empty?
      redirect_to post_path(@post)
    else
      render "new"
    end
  end

  def update

    @post.update_attributes(post_param)
    if @post.errors.empty?
      redirect_to post_path(@post)
    else
      render "edit"
    end
  end


  def destroy

    @post.destroy
    redirect_to action: "index"
  end

  private
    def post_param
      params.require(:post).permit(:name, :year, :body, :size)
    end

    def find_post
      @post = Post.find(params[:id])
    end

end
