class UsersController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response
    
    def show
        user = User.find_by(id: params[:id])
        render json: user, include: :items
    end

    private
    def render_record_not_found_response
        render json: {error: "User Not Found"}, status: :not_found
    end

end
