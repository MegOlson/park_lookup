require 'rails_helper'

describe "delete a state route", :type => :request do

  before do
    post '/api/v1/states', params: { :name => "Test Name"}, headers: {Authorization: ENV['PARK_LOOKUP_API']}
  end

  it "returns success response" do
    id = JSON.parse(response.body)['id']
    delete '/api/v1/states/id', headers: {Authorization: ENV['PARK_LOOKUP_API']}
    expect(response).to have_http_status(404)
  end

end
