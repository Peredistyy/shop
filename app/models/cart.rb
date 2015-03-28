class Cart

  def initialize(session)
    @session = session
  end

  def add_product(product)
    @session[:cart] ||= {}
    if @session[:cart].key? product.id.to_s
      @session[:cart][product.id.to_s]['qty'] += 1
    else
      @session[:cart][product.id] = {
          'product_id' => product.id,
          'qty' => 1
      }
    end
  end

  def clean
    @session[:cart] = {}
  end

  def items
    if @session.has_key? :cart
      items = @session[:cart].clone
      items.map { |key, value| value['product'] = Product.find(value['product_id']) }
      items
    else
      {}
    end
  end

  def size
    if @session.has_key? :cart
      qty = 0
      @session[:cart].each { |key, value| qty += value['qty'] }
      qty
    else
      0
    end
  end

  def summ_price
    summ_price = 0
    items.each { |key, value| summ_price += value['qty'] * value['product'].price }
    sprintf('%.2f', summ_price).to_f
  end

end