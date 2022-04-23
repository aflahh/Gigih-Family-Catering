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
    @menu = Menu.new(menu_params)
    
    if @menu.save
      redirect_to(@menu)
    else
      render :action => "new"
    end
  end
  
  
  def update
    @menu = Menu.find(params[:id])
  
    if @menu.update(menu_params)
      redirect_to(@menu)
    else
      render :action => "edit", :status => :unprocessable_entity
    end
  end
  
  
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    
    redirect_to(menus_path)
  end

  def menu_params
    params.require(:menu).permit(:name, :price, :description, :category_ids => [])
  end
end
