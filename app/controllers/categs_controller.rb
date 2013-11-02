class CategsController < ApplicationController

before_filter :find_categ,  only: [:show, :edit, :update, :destroy]

  def index
    @categs = Categ.all
    #render text: @categs.map{ |i| "#{i.name}"}.join("<br/>")
  end

  def show
    unless @categ
      render text: "Page not found", status: 404
    end
  end


  def new
    @categ = Categ.new
  end


  def edit

  end

  def create
    #@categ = Category.create(category_param)
    #render text: " #{@categ.id} : #{@categ.name}  (#{!@categ.new_record?})"
    #render text: params.inspect
    @categ = Categ.create(categ_param)
    if @categ.errors.empty?
      redirect_to categ_path(@categ)
    else
      render "new"
    end
  end

  def update

    @categ.update_attributes(categ_param)
    if @categ.errors.empty?
      redirect_to categ_path(@categ)
    else
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
