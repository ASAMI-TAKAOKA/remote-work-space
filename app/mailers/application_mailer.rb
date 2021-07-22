class ApplicationMailer < ActionMailer::Base
  default from: 'MyDomain <noreply@telespo.net>'
  layout 'mailer'
end
