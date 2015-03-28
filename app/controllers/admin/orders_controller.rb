class Admin::OrdersController < AdminController

  def index
    @orders = Order.paginate(page: params[:page], per_page: 5)
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      redirect_to admin_orders_path
    else
      render 'edit'
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
