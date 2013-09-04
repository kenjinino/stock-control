class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  check_authorization :unless => :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      redirect_to orders_path, alert: t("helpers.cancan.denied.alert")
    else
      redirect_to root_url, alert: t("helpers.cancan.denied.not_signed_in.alert")
    end
  end

  def after_sign_in_path_for(resource)
    orders_path
  end
end
