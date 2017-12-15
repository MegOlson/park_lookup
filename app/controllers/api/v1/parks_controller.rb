class Api::V1::ParksController < ApplicationController
  include Response

  def index
    @parks = Park.all
    state = params[:state_id]
    name = params[:name]
    if state
      @parks = Park.parks(state)
    end
    if name
      @parks = Park.by_name(name)
    end
    json_response(@parks)
  end

   def show
     @state = State.find(params[:state_id])
     @park = @state.parks.find(params[:id])
     json_response(@park)
   end

   def create
     @state = State.find(params[:state_id])
     @park = @state.parks.create!(park_params)
     json_response(@park, :created)
   end

   def update
     @state = State.find(params[:state_id])
     @park = @state.parks.find(params[:id])
     if @park.update!(park_params)
       render status: 200, json: {
         message: "Your park has been updated successfully!"
       }
     end
   end

   def destroy
     @state = State.find(params[:state_id])
     @park = @state.parks.find(params[:id])
     if @park.destroy!
       render status: 200, json: {
         message: "Your park has been deleted successfully!"
       }
     end
   end

  private

   def park_params
     params.permit(:name)
   end

end
