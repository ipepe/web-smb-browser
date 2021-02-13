require "base64"

module SambaHelper
  def entry_icon(type)
    if type == :directory
      content_tag(:i,nil, class: 'fa fa-folder-open')
    else
      content_tag(:i, nil, class: 'fa fa-file')
    end
  end

  def ls_link(name, attributes, current_path)
    if attributes[:type] == :directory
      link_to(name, ls_path(ls_path: [name].concat(current_path).join('/')))
    else
      link_to(name, download_path(ls_path: [name].concat(current_path).join('/')))
    end
  end

  def base64encode(string)
    Base64.encode64(string)
  end

  def base64decode(string)
    Base64.decode64(string)
  end

  def human_size(number)
    number_to_human_size(number, options = {})
  end
end