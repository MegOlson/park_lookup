require 'rails_helper'


describe "post a state route", :type => :request do

  it "returns error response when fields are left blank" do
    post '/api/v1/states', params: { name: ""}, headers: {Authorization: ENV['PARK_LOOKUP_API']}
    expect(response).to have_http_status(422)
  end

  before do
    post '/api/v1/states', params: { :name => "Test name"}, headers: {Authorization: ENV['PARK_LOOKUP_API']}
  end

  it "returns the state's name" do
    expect(JSON.parse(response.body)['name']).to eq 'Test name'
  end

  it "returns a created status" do
    expect(response).to have_http_status(:created)
  end

end
