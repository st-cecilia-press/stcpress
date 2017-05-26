require 'rails_helper'
describe "Get /pages/new" do
  it "shows edit page for logged in user" do
    user = create(:user, name: 'Dingus', admin:true)
    sign_in(user)
    get "/pages/new"
    expect(response).to have_http_status(:success) 
    expect(response.body).to include('<h1>New Page</h1>')
  end
  it "redirects if not logged in" do
    get "/pages/new"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    user = create(:user, admin: false)
    sign_in(user)
    expect{get "/pages/new"}.to raise_error(CanCan::AccessDenied)
  end
end
