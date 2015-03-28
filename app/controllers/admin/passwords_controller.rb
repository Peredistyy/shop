class Admin::PasswordsController < Devise::PasswordsController

  def new
    flash[:info] = t 'admin.message.password_recovery_disable'
    redirect_to new_admin_session_url
  end

  def create
    flash[:info] = t 'admin.message.password_recovery_disable'
    redirect_to new_admin_session_url
  end

end