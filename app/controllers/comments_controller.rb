class CommentsController < ApplicationController

before_filter :find_comment,  only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
    unless @comment
      render text: "Page not found", status: 404
    end
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.create(comment_param)
    if @comment.errors.empty?
      redirect_to comment_path(@comment)
    else
      flash.now[:error] = "You made mistakes."
      render "new"
    end
  end

  def update
    @comment.update_attributes(comment_param)
    if @comment.errors.empty?
      redirect_to comment_path(@comment)
    else
      render "edit"
    end
  end

  def destroy
    @comment.destroy
    redirect_to action: "index"
  end

private
  def comment_param
    params.require(:comment).permit(:body)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

end
