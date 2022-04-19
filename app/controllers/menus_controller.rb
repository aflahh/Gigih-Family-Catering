class MenusController < ApplicationController
  def index
    @menus = params[:letter].nil? ? Menu.all : Menu.by_letter(params[:letter])
  end
  
  def show
    @menu = Menu.find(params[:id])
  end

  def new
    @menu = Menu.new
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def create
    @menu = Menu.new(params[:menu].permit(:name, :description, :price))
  
    if @menu.save
      redirect_to(@menu)
    else
      render :action => "new"
    end
  end
  
  
  def update
    @menu = Menu.find(params[:id])
  
    if @menu.update(params[:menu].permit(:name, :description, :price))
      redirect_to(@menu)
    else
      render :action => "edit", :status => :unprocessable_entity
    end
  end
  
  
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    
    redirect_to(menus_url)
  end
end
