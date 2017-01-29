require 'rails_helper'

describe "GET /tools/cpdl" do
  it "shows cpdl text generator" do

    get "/tools/cpdl"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('CPDL Tool')
  end
end
