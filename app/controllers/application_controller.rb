class ApplicationController < ActionController::Base
  #ログイン状態によって表示するページを切り替える
  #処理が呼ばれた段階でユーザーがログインしていなければログイン画面に遷移
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  

end
