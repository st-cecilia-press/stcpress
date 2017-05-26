require 'rails_helper'
describe "Get /admin/users" do
  it "shows users manager" do
    user = create(:user, name: 'Dingus', admin:true)
    sign_in(user)
    get '/admin/users'
    expect(response).to have_http_status(:success) 
    expect(response.body).to include('<h1>Manage Users</h1>')
  end
  it "redirects if not logged in" do
    get "/admin/users"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    user = create(:user, admin: false)
    sign_in(user)
    expect{get "/admin/users"}.to raise_error(CanCan::AccessDenied)
  end
end
