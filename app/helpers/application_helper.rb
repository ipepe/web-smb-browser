module ApplicationHelper
  def current_theme_stylesheet_name
    if cookies.permanent[:theme_name]&.in?(Rails.application.theme_names.map(&:to_s))
      "themes/#{cookies.permanent[:theme_name]}"
    else
      'themes/yeti'
    end
  end

  def li_change_theme_to(theme_name)
    path = Rails.application.routes.url_helpers.change_theme_path(theme_name: theme_name)
    link = link_to(theme_name.humanize, path)
    content_tag(:li, link, class: ('active' if current_theme_stylesheet_name.include?(theme_name)))
  end

  def page_title
    [I18n.t('application.title'), @page_subtitle].flatten.compact.join(' - ')
  end


end
