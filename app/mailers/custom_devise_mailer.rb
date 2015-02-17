class CustomDeviseMailer < Devise::Mailer
  default from:     '"OsiriX Nodes" <support@osirixnodes.com>'
  default reply_to: '"Björn Albers" <bjoernalbers@gmail.com>'
end
