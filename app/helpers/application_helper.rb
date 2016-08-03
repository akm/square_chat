module ApplicationHelper

  def button_link_to(title, href, options = {})
    options[:class] = [options[:class], 'button_link'].compact.join(' ')
    options[:type] = 'button'
    options[:'data-href'] = href
    content_tag(:button, title, options)
  end
end
