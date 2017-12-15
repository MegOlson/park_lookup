require 'rails_helper'

describe "post a park route" do
  let!(:park) { FactoryBot.create(:park) }

  before do
    post "/api/v1/states/#{park.id}/parks", params: { name: 'Test Name'}, headers: {Authorization: ENV['PARK_LOOKUP_API']}
  end

  it 'returns the park name' do
    expect(JSON.parse(response.body)['name']).to eq 'Test Name'
  end

  it "returns a created status" do
    expect(response).to have_http_status(:created)
  end

end
