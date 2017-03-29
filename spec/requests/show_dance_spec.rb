require 'rails_helper'
describe "GET /dances/slug" do
  it "shows dance with title" do
    person = create(:person)
    cat = create(:dance_category)
    dance = create(:dance, title: 'Gathering Peascods', slug: 'slug', person: person, dance_category: cat)
    inst = create(:instruction, text:'Text', dance: dance)
    get "/dances/slug"
    expect(response).to have_http_status(:success)
    expect(response.body).to include(dance.title)
    
  end
end
