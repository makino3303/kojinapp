class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_locale
    layout :layout_by_resource

    protected

    def set_locale
      I18n.locale = locale
    end
  
    def locale
      # ここで言語の切り替えを行う
      @locale ||= params[:locale] || I18n.default_locale
    end

    def layout_by_resource
      if devise_controller?
        "devise"
      else
        "application"
      end
    end
  
    def configure_permitted_parameters
      added_attrs = [ :name, :kana, :email, :password, :password_confirmation　]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end
    
end
