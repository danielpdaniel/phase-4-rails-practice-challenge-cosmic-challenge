class ScientistsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

    def index
        scientists = Scientist.all
        render json: scientists
    end

    def show
        scientist = Scientist.find(params[:id])
        render json: scientist, serializer: ScientistShowSerializer
    end

    def create
        scientist = Scientist.create!(permitted_scientist_params)
        render json: scientist, status: :created
    end

    def update
        scientist = Scientist.find(params[:id])
        scientist.update!(permitted_scientist_params)

        render json: scientist, status: :accepted
    end

    def destroy
        scientist = Scientist.find(params[:id]).destroy
        render json: {}, status: :no_content
    end

    private

    def render_not_found_response
        render json: { error: "Scientist not found" }, status: :not_found
    end

    def render_invalid_response(invalid)
        
        render json: { errors: [invalid.record.errors] }, status: :unprocessable_entity
    end

    def permitted_scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end
end
