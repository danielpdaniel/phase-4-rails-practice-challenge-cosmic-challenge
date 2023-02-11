class MissionsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :mission_invalid_response

    def create
        mission = Mission.create!(permitted_mission_params)
        render json: mission.planet, status: :created
    end

    private

    def mission_invalid_response(invalid)
        render json: { errors: [invalid.record.errors] }, status: :unprocessable_entity
    end

    def permitted_mission_params
        params.permit(:name, :scientist_id, :planet_id)
    end
end
