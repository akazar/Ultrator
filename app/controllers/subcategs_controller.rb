class SubcategsController < ApplicationController

before_filter :find_subcateg,  only: [:show, :edit, :update, :destroy]

  def index
    @subcategs = Subcateg.all
  end

  def show
    unless @subcateg
      render text: "Page not found", status: 404
    end
  end

  def new
    @subcateg = Subcateg.new
  end

  def edit
  end

  def create
    @subcateg = Subcateg.create(subcateg_param)
    if @subcateg.errors.empty?
      redirect_to subcateg_path(@subcateg)
    else
      flash.now[:error] = "You made mistakes."
      render "new"
    end
  end

  def update
    @subcateg.update_attributes(subcateg_param)
    if @subcateg.errors.empty?
      redirect_to subcateg_path(@subcateg)
    else
      flash.now[:error] = "You made mistakes."
      render "edit"
    end
  end

  def destroy
    @subcateg.destroy
    redirect_to action: "index"
  end

  private
  def subcateg_param
    params.require(:subcateg).permit(:name)
  end

  def find_subcateg
    @subcateg = Subcateg.find(params[:id])
  end

end
