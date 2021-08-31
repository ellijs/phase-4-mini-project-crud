class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def index
        spices = Spice.all
        render json: spices
    end

    def create 
        a= Spice.create(spice_params)
        render json: a
    end

    def show
        spice = find_by
        render json: spice
    end

    def update
        spice = find_by
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        spice = find_by
        spice.destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_by
        Spice.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Spice not found"}, status: :not_found
    end
end
