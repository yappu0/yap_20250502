module ApplicationHelper
  def render_status_icon(active:)
    icon_class = active ? 'bi-check-circle-fill' : 'bi-dash'
    content_tag(:i, nil, class: "bi #{icon_class}")
  end
end
