require 'rails_helper'

describe 'put a park route', :type => :request do

  before do
    @state = FactoryBot.create(:state)
    @park = FactoryBot.create(:park, state: @state)
  end

  it "returns a sucess response" do
    put "/api/v1/states/#{@state.id}/parks/#{@park.id}", params: {:name => "New Name"}, headers: {Authorization: ENV['PARK_LOOKUP_API']}
    expect(response).to have_http_status(200)
  end

end
