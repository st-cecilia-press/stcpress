require "rails_helper"
describe "put /pages" do
  it "edits profile for signed in laurel, and redirects to profile page" do
    user = create(:user, admin: true)
    sign_in(user)

    post "/pages", :page => {title: 'New Title', slug: 'newslug', body: 'New Body'}
    expect(Page.first.title).to eq('New Title')
    expect(Page.first.slug).to eq('newslug')
    expect(Page.first.body).to eq('New Body')
    expect(response).to redirect_to "/pages/#{Page.first.slug}"
  end
  it "redirects to new page if fails to save" do
    user = create(:user, admin: true)
    sign_in(user)

    post "/pages", :page => {title: 'New Title', slug: '', body: 'New Body'}
    expect(Page.count).to eq(0)
  end
  it "redirects if not logged in" do
    pg = create(:page)
    post "/pages", :page => {title: 'New Title', slug: 'newslug', body: 'New Body'} 
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end

  
end
