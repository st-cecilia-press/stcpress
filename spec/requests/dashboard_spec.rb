require 'rails_helper'
describe "Get /dashboard" do
  it "shows dashboard to logged in user" do
    user = create(:user, name: 'Dingus')
    sign_in(user)
    get '/dashboard'
    expect(response).to have_http_status(:success) 
    expect(response.body).to include('<h1>Dashboard</h1>')
  end
  it "shows admin tasks for admin user" do
    user = create(:user, name: 'Dingus', admin: true)
    sign_in(user)
    get '/dashboard'
    expect(response.body).to include('<h3>Admin Tasks</h3>')
  end
  it "does not show admin tasks for non-admin user" do
    user = create(:user, name: 'Dingus', admin: false)
    sign_in(user)
    get '/dashboard'
    expect(response.body).not_to include('<h3>Admin Tasks</h3>')
  end
  it "redirects if not logged in" do
    get "/dashboard"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
