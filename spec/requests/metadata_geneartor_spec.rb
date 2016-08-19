require 'rails_helper'

describe "GET /tools/metadata_generator" do
  it "shows about metadata generator" do

    get "/tools/metadata_generator"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Metadata Generator')
  end
end
