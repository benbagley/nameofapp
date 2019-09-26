class ApplicationController < ActionController::Base

  #redirect and flash notification in case of user trying to do something they're not authorised to
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end

  #permit first_name and last_name with Devise
  class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name] )
    end
  end
end
