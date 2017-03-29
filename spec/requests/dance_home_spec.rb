require 'rails_helper'
describe "Get /dance" do
  it "shows dance home page" do
    get "/dance"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('SCA Dance')
  end
end
