module ApplicationHelper

  def user_resource_name
    :user
  end

  def user_resource
    @resource ||= User.new
  end

  def cart_size
    @cart.size
  end

  def flash_class(level)
    case level
      when 'notice' then 'alert alert-info'
      when 'info' then 'alert alert-info'
      when 'success' then 'alert alert-success'
      when 'error' then 'alert alert-danger'
      when 'alert' then 'alert alert-warning'
    end
  end

end
