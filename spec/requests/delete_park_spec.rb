require 'rails_helper'

describe "delete a park route" do

  before do
    @state = FactoryBot.create(:state)
    @park = FactoryBot.create(:park, state: @state)
  end

  it "returns a success code" do
    delete "/api/v1/states/#{@state.id}/parks/#{@park.id}", headers: {Authorization: ENV['PARK_LOOKUP_API']}
    expect(response).to have_http_status(200)
  end

end
