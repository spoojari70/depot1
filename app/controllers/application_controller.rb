class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params
  before_action :authorize

  protected
    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end

    def authorize_admin
      unless session[:user_id] && User.exists?(session[:user_id]) && User.find(session[:user_id]).admin == 1
        redirect_to store_index_url, notice: "Please log in as admin"
      end
    end

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else
          flash.now[:notice] =
            "#{params[:locale]} translation not available yet !"
          logger.error flash.now[:notice]
        end
      end
    end

end
