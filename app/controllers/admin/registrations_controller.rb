class Admin::RegistrationsController < Devise::RegistrationsController

  def new
    flash[:info] = t 'admin.message.registrations_disable'
    redirect_to new_admin_session_url
  end

  def create
    flash[:info] = t 'admin.message.registrations_disable'
    redirect_to new_admin_session_url
  end

end