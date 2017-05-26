require 'rails_helper'
describe 'get /pages/slug' do
  it "shows page for given slug" do
    create(:page, title: 'Title', body: 'I am a body.', slug: 'demo')
    get '/pages/demo'
    expect(response).to have_http_status(:success)
    expect(response.body).to include('<h1>Title</h1>')
    expect(response.body).to include('I am a body.')
  end

  it "shows edit button if admin" do
    user = create(:user, admin: true) 
    sign_in(user)
    create(:page, title: 'Title', body: 'I am a body.', slug: 'demo')
    get '/pages/demo'
    expect(response.body).to include('Edit')
  end
end
