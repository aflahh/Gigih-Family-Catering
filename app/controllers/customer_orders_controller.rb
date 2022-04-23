 class CustomerOrdersController < ApplicationController
  def index
    if params[:letter].present?
      @customer_orders = CustomerOrder.by_letter(params[:letter])
    elsif params[:date].present?
      @customer_orders = CustomerOrder.by_date(params[:date])
    else
      @customer_orders = CustomerOrder.all
    end
    @today = Date.today
  end

  def show
    @customer_order = CustomerOrder.find(params[:id])
  end

  def new
    @customer_order = CustomerOrder.new
    # 3.times do
      @customer_order.order_details.build
    # end
  end

  def edit
    @customer_order = CustomerOrder.find(params[:id])
  end

  def create
    @customer_order = CustomerOrder.new(customer_order_params)
    
    total_price = 0
    params[:customer_order][:order_details_attributes].each do |e, v|
      total_price = total_price + (v['qty'].to_f * v['price'].to_f)
    end  
    
    @customer_order.total_price = total_price
    
    if @customer_order.save
      redirect_to(@customer_order)
    else
      render :action => "new"
    end
  end
  
  
  def update
    @customer_order = CustomerOrder.find(params[:id])
  
    if @customer_order.update(customer_order_params)
      redirect_to(@customer_order)
    else
      render :action => "edit", :status => :unprocessable_entity
    end
  end
  
  
  def destroy
    @customer_order = CustomerOrder.find(params[:id])
    @customer_order.destroy
    
    redirect_to(customer_orders_path)
  end

  def customer_order_params
    params.require(:customer_order).permit(:name, :email, :status, order_details_attributes: [:qty, :menu_id, :price] )
  end
end
