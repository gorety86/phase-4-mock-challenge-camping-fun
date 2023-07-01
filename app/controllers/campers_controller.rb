class CampersController < ApplicationController
    def index
        campers = Camper.all
        render json: campers
    end

    def show 
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: {
              id: camper.id,
              name: camper.name,
              age: camper.age,
              activities: camper.activities.as_json(only: [:id, :name, :difficulty]) 
            }
          else
            render json: { error: "Camper not found" }, status: :not_found
          end    
        end 

    def create
        camper = Camper.new(camper_params)
        if camper.save
            render json: camper.to_json(except: [:created_at, :updated_at]), status: :created
          else
            render json: { errors: camper.errors.full_messages }, status: :unprocessable_entity
          end
    end

    private
    def camper_params
        params.permit(:name, :age)
    end
end
