class CartController < ApplicationController

  def index
    @items = @cart.items
    @summ_price = @cart.summ_price
  end

  def add_item
    if Product.exists?(add_item_product_id_param)
      product = Product.find(add_item_product_id_param)
      @cart.add_product product
      flash[:notice] = t 'shop.message.success_add_to_cart', product_name: product.title
    end

    redirect_to url_for(controller: :catalog, action: :list)
  end

  def clean
    @cart.clean

    redirect_to url_for(controller: :cart, action: :index)
  end

  private

  def add_item_product_id_param
    params.require(:product_id)
  end

end
