class OrdersController < ApplicationController

  before_filter :authenticate_user!

  def index
    @orders = Order.where(user: current_user)
                  .paginate(page: params[:page], per_page: 5)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user

    @cart.items.each do |key, item|
      @order.order_items << OrderItem.create(
          title: item['product'].title,
          description: item['product'].description,
          price: item['product'].price,
          qty: item['qty']
      );
    end

    if @order.save
      @cart.clean
      redirect_to orders_path
    else
      render 'new'
    end
  end

  private

  def order_params
    params.require(:order).permit(:contact_info)
  end

end
