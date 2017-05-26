require 'rails_helper'
describe "Get /pages/:id/edit" do
  it "shows edit page for logged in user" do
    user = create(:user, name: 'Dingus', admin:true)
    sign_in(user)
    pg = create(:page)
    get "/pages/#{pg.id}/edit"
    expect(response).to have_http_status(:success) 
    expect(response.body).to include('<h1>Edit Page</h1>')
  end
  it "redirects if not logged in" do
    pg = create(:page)
    get "/pages/#{pg.id}/edit"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    user = create(:user, admin: false)
    pg = create(:page)
    sign_in(user)
    expect{get "/pages/#{pg.id}/edit"}.to raise_error(CanCan::AccessDenied)
  end
end
