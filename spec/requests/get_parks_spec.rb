require 'rails_helper'

describe "get all parks from single state" do
  let!(:states) { FactoryBot.create(:state) }
  let!(:parks) { FactoryBot.create_list(:park, 20, state: states) }

  before { get "/api/v1/states/#{states.id}/parks", headers: {Authorization: ENV['PARK_LOOKUP_API']}}

  it 'returns all parks for a state' do
    expect(JSON.parse(response.body).size).to eq 20
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end

describe "get single park from single state" do
  let!(:states) { FactoryBot.create(:state) }
  let!(:parks) { FactoryBot.create(:park, state: states) }

  before { get "/api/v1/states/#{states.id}/parks/#{parks.id}", headers: {Authorization: ENV['PARK_LOOKUP_API']}}

  it 'returns one park for one state' do
    expect(JSON.parse(response.body).size).to eq 3
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end

describe "get a random park from a single state" do
  let!(:states) { FactoryBot.create(:state) }
  let!(:parks) { FactoryBot.create(:park, state: states) }

  before { get "/api/v1/states/#{states.id}/parks", params: {random: 'true'}, headers: {Authorization: ENV['PARK_LOOKUP_API']}}

  it 'returns one random park for one state' do
    expect(JSON.parse(response.body).size).to eq 1
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
