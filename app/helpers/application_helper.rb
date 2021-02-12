module ApplicationHelper
  def current_theme_stylesheet_name
    if cookies.permanent[:theme_name]&.in?(Rails.application.theme_names.map(&:to_s))
      "themes/#{cookies.permanent[:theme_name]}"
    else
      'themes/yeti'
    end
  end

  def page_title
    [I18n.t('application.title'), @page_subtitle].flatten.compact.join(' - ')
  end

  def javascript_controller_name
    controller.class.name.gsub('Controller', '') + action_name.capitalize
  end

  def create_issue_modal
    render partial: 'create_issue_modal', locals: { story: @story, project: @project, issue: @issue, taskboard: @taskboard }
  end

  def render_markdown(template)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render(template || '')
  end

  def previous_page(fallback_location: root_url)
    request&.referer || fallback_location
  end
end
