require 'rails_helper'

describe "put a state route", :type => :request do

  before do
    @state = FactoryBot.create(:state)
  end

  it "retunrs a sucess response" do
    put "/api/v1/states/#{@state.id}", params: {:name => "New Name"}, headers: {Authorization: ENV['PARK_LOOKUP_API']}
    expect(response).to have_http_status(200)
  end

  end
