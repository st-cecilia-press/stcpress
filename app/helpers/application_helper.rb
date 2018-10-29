module ApplicationHelper
  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      tables: true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
  def nav_link_to(name, url)
    "<li class='nav-item'>#{link_to(name, url, class: 'nav-link')}</li>".html_safe
  end
  def nav_dropdown_link_to(name, url)
    link_to(name, url, class: 'dropdown-item')
  end
end
