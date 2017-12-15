require 'rails_helper'


describe "get all states route", :type => :request do
  let!(:states) { FactoryBot.create_list(:state, 20) }

  before { get '/api/v1/states', headers: {Authorization: ENV['PARK_LOOKUP_API']}}

  it "returns all states in one page" do
    expect(JSON.parse(response.body).size).to eq 5
  end

  it "returns status code 200" do
    expect(response).to have_http_status(:success)
  end
end


describe "returns state specified by state id", :type => :request do
  let!(:states) { FactoryBot.create(:state) }

  before { get "/api/v1/states/#{states.id}", headers: {Authorization: ENV['PARK_LOOKUP_API']}}

  it "returns one state matching state id" do
    expect(JSON.parse(response.body).size).to eq 2
  end

  it "returns status code 200" do
    expect(response).to have_http_status(:success)
  end

end
