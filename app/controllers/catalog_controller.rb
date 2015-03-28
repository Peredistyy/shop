class CatalogController < ApplicationController

  def list
    @products = Product.all
  end

end
