require 'rails_helper'
describe "GET /dance_sources/dance_source" do
  it "shows dance source with title and lists dances in source" do
    source = create(:dance_source, name: 'Dance Source', slug: 'dance_source')
    dance = create(:dance, title: 'Gathering Peascods', slug: 'slug')
    dsc = create(:dance_source_content, dance_source: source, dance: dance) 
    get "/dance_sources/dance_source"
    expect(response).to have_http_status(:success)
    expect(response.body).to include(dance.title)
    expect(response.body).to include(source.name)
  end
end
