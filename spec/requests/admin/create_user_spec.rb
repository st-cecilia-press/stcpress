require "rails_helper"
describe "post /admin/users" do
  it "creates new user" do
    admin = create(:user, admin: true)
    sign_in(admin)
    expect(User.count).to eq(1)
    post '/admin/users', :user => {name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} 
    expect(User.count).to eq(2)
  end
  it "sends change password email to new user" do
    admin = create(:user, name: 'Mundugus Jones', admin: true)
    sign_in(admin)
    post '/admin/users', :user => {name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} 
    email = ActionMailer::Base.deliveries.last
    expect(email.to[0]).to eq('dingus@doogleson.com')
    expect(email.body).to include('Welcome to St. Cecilia Press')
  end
end
