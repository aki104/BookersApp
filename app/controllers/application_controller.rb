class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
 
  def after_sign_out_path_for(resource)
    top_path # ログアウト後に遷移するpathを設定
  end

  def after_sign_in_path_for(resource)
    user_path(@user.id)
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password])
    # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :password, :password_confirmation) }
    # ログインしたときにusernameを使える
    # devise_parameter_sanitizer.permit

  end

end
