module RequestSpecHelper

  def self.included(base)
    ::Warden.test_mode!
    base.before(:each) { Warden.test_mode! }
    base.after(:each) { Warden.test_reset! }
  end

  def sign_in(user)
    Warden.on_next_request do |proxy|
      proxy.set_user(user, { scope: :user, event: :authentication })
    end
  end

  def sign_out()
    Warden.on_next_request do |proxy|
      proxy.logout(:user)
    end
  end

  private

end

