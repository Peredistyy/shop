class Admin::ProductsController < AdminController

  def index
    @items = Product.paginate(page: params[:page], per_page: 5)
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render 'edit'
    end
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to edit_admin_product_path(@product)
    else
      render 'new'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :image, :price)
  end

end
