class StaticController < ActionController::Base
  protect_from_forgery with: :exception

  def change_theme
    if params[:theme_name].in?(Rails.application.theme_names.map(&:to_s))
      cookies.permanent[:theme_name] = params[:theme_name]
    end
    redirect_back fallback_location: root_url
  end
end
