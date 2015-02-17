module ApplicationHelper
  def support_email(text = 'bjoernalbers@gmail.com')
    link_to(text, 'mailto:bjoernalbers@gmail.com')
  end
end
