require 'rails_helper'

describe "GET /categories" do
  it "shows all categories with title and link to dance page" do
    cat1 = create(:dance_category, name: 'Category 1')
    cat2 = create(:dance_category, name: 'Category 2' )

    get '/dance_categories'
    expect(response).to have_http_status(:success)
    expect(response.body).to include("<a href=\"/dance_categories/Category_1\">Category 1</a>")
    expect(response.body).to include("<a href=\"/dance_categories/Category_2\">Category 2</a>")
  end
end
