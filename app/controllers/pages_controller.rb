class PagesController < ApplicationController

before_filter :find_page,  only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def show
    unless @page
      render text: "Page not found", status: 404
    end
  end

  def new
    @page = Page.new
  end

  def edit
  end

  def create
    @page = Page.create(page_param)
    if @page.errors.empty?
      redirect_to page_path(@page)
    else
      flash.now[:error] = "You made mistakes."
      render "new"
    end
  end

  def update
    @page.update_attributes(page_param)
    if @page.errors.empty?
      redirect_to page_path(@page)
    else
      flash.now[:error] = "You made mistakes."
      render "edit"
    end
  end

  def destroy
    @page.destroy
    redirect_to action: "index"
  end

private
  def page_param
    params.require(:page).permit(:name, :body)
  end

  def find_page
    @page = Page.find(params[:id])
  end


end
