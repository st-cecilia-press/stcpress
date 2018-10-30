require 'rails_helper'
describe "Get /" do
  it "shows home page" do
    get "/"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('St. Cecilia Press')
  end
end
