require 'rails_helper'

include ERB::Util

RSpec.feature "Contact email" do

  def send_email
    subject = 'TEST SUBJECT'
    from = 'bob@example.com'
    from_name = 'Bob Exampleman'
    body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    fill_in "subject", with: subject
    fill_in "from_email", with: from
    fill_in "from_name", with: from_name
    fill_in "feedback", with: body
    click_on "Send"
  end

  def expect_email(expected_whom, expected_back)
    email = ActionMailer::Base.deliveries.last
    expect(email.to[0]).to eq(expected_whom)
    expect(email.subject).to match('TEST SUBJECT')

    # asset reply to and body as well
    # make sure we can get back to where we were
    expect(page.body).to have_content('feedback has been sent')
    click_on 'Back'
    expect(page.current_path).to eq expected_back
  end

  scenario "sends email to Nique" do
    visit '/'
    click_on 'Contact' 
    send_email
    expect_email('nique.rio@gmail.com','/')
  end

  scenario 'does not send email without recaptcha' do
    Recaptcha.configuration.skip_verify_env.delete("test")
    visit '/'
    click_on 'Contact'
    expect { send_email }.not_to change(ActionMailer::Base.deliveries, :count)
  end


end
