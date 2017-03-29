require 'rails_helper'
describe "GET /dance_categories/dance_category" do
  it "shows dance with title" do
    cat = create(:dance_category, name: 'Dance Category')
    dance = create(:dance, title: 'Gathering Peascods', slug: 'slug', dance_category: cat)
    get "/dance_categories/Dance_Category"
    expect(response).to have_http_status(:success)
    expect(response.body).to include(dance.title)
    expect(response.body).to include(cat.name)
  end
end
