module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-#{flash.keys[0] == 'notice' ? 'success' : 'danger'}"> <button type="button"
    class="close" data-dismiss="alert">x</button>
      #{messages}
    </div>
    HTML

    html.html_safe
  end

  def devise_custome_error_messages!
    return '' if flash.keys.empty?
    messages = flash.keys.map { |key| content_tag(:div, flash[key]) }.join
    html = <<-HTML
    <div class="alert alert-#{flash.keys[0] == 'notice' ? 'success' : 'danger'}"> <button type="button"
    class="close" data-dismiss="alert">x</button>
      #{messages}
    </div>
    HTML

    html.html_safe
  end
end