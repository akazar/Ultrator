class CategsController < ApplicationController

before_filter :find_categ,  only: [:show, :edit, :update, :destroy]

  def index
    @categs = Categ.all
  end

  def show
  end

  def new
    @categ = Categ.new
  end

  def edit
  end

  def create
    @categ = Categ.create(categ_param)
    if @categ.errors.empty?
      redirect_to categ_path(@categ)
    else
      flash.now[:error] = "You made mistakes."
      render "new"
    end
  end

  def update
    @categ.update_attributes(categ_param)
    if @categ.errors.empty?
      redirect_to categ_path(@categ)
    else
      flash.now[:error] = "You made mistakes."
      render "edit"
    end
  end

  def destroy
    @categ.destroy
    redirect_to action: "index"
  end

private
  def categ_param
    params.require(:categ).permit(:name)
  end

  def find_categ
    @categ = Categ.find(params[:id])
  end


end
