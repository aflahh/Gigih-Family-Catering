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
    @mc_ids = params[:menu][:category_ids].reject(&:empty?).map(&:to_i)
    
    if @menu.save
      menu_category_create_if_not_exist(@mc_ids, @menu.id)
      redirect_to(@menu)
    else
      render :action => "new"
    end
  end
  
  
  def update
    @menu = Menu.find(params[:id])
    @mc_ids = params[:menu][:category_ids].reject(&:empty?).map(&:to_i)
    @mc_excludes = Category.all.ids.difference(@mc_ids)
  
    if @menu.update(menu_params)
      menu_category_destroy_if_excluded(@mc_excludes, @menu.id)
      menu_category_create_if_not_exist(@mc_ids, @menu.id)
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

  def menu_params
    params.require(:menu).permit(:name, :price, :description)
  end

  def menu_category_create_if_not_exist(mc_ids, menu_id)
    mc_ids.each do |mc_id|
      MenuCategory.where(menu_id: menu_id, category_id: mc_id).first_or_create
    end
  end

  def menu_category_destroy_if_excluded(mc_excludes, menu_id)
    mc_excludes.each do |mc_id|
          MenuCategory.find_by(menu_id: menu_id, category_id: mc_id).try(:destroy)
      end
  end
end
