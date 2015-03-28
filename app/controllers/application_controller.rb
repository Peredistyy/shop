class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_filter :set_locale, :initialize_cart

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

  private

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  def after_sign_in_path_for(resource)
    if resource.is_a? Admin
      admin_products_path
    end
  end

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def initialize_cart
    @cart = Cart.new(session)
  end

end
