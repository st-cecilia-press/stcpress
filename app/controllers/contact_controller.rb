class ContactController < ApplicationController
  def new
    @back_link = request.referrer
  end
  def create
    @referring_page = params[:referring_page]

    if verify_recaptcha
      feedback = params[:feedback]
      from_name = params[:from_name]
      from_email = params[:from_email]
      subject = params[:subject]

      # reject it if it isn't on this site
      @referring_page = nil unless @referring_page.match("^#{root_url}")

      c = ContactForm.new(:name => from_name, :email => from_email, :message => feedback, :subject => subject)
      c.deliver
    else
      render 'new'
    end
  end
end
