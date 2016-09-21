require 'rails_helper'
describe "Get /tags/name" do
    it "shows pieces with given tag" do
        piece = create(:piece)
        tag = create(:tag)
        t = create(:tagging, tag: tag, piece: piece)

        get "/tags/#{tag.name}"
        expect(response).to have_http_status(:success)
        expect(response.body).to include(tag.name)
        expect(response.body).to include(piece.title)
        
    end
end
