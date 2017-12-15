class Api::V1::StatesController < ApplicationController
  include Response

  def index
    @states = State.paginate(:page => params[:page], :per_page => 5)
    name = params[:name]
    if name
      @states = State.search_by_name(name)
    end
    json_response(@states)
  end

  def show
    @state = State.find(params[:id])
    json_response(@state)
  end

  def create
    @state = State.create!(state_params)
    json_response(@state, :created)
  end

  def update
    @state = State.find(params[:id])
    if @state.update!(state_params)
      render status: 200, json: {
        message: "Your state has been updated successfully!"
      }
    end
  end

  def destroy
    @state = State.find(params[:id])
    if @state.destroy!
      render status: 200, json: {
        message: "Your state has been deleted successfully!"
      }
    end
  end

  private

  def state_params
    params.permit(:name)
  end

end
