class MyMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  def reset_password_instructions(record, token, opts={})
    @token = token
    if record.last_sign_in_at.nil? && record.created_at > (Time.now - 10.minutes)
      devise_mail(record, :welcome, opts)
    else
      devise_mail(record, :reset_password_instructions, opts)
    end
  end
end
