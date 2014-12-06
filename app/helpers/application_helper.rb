module ApplicationHelper
  def support_email(text = 'support@osirixnodes.com')
    link_to(text, 'mailto:support@osirixnodes.com')
  end
end
