class FestivalsController < ApplicationController
    def index 
        festivals = Festival.all
        render json: FestivalSerializer.new(festivals).to_serialized_json
    end

    def new
        festival = Festival.new
    end

    def create 
        festival = Festival.create(festival_params)
        render json: FestivalSerializer.new(festival).to_serialized_json
    end

    def show
        festival = Festival.find(params[:id])
        render json: FestivalSerializer.new(festival).to_serialized_json
    end

    # def edit
    #     festival = Festival.find(params[:id])
    # end

    # def update 
    #     festival = Festival.find(params[:id])
    #     Festival.update(festival_params)
    #     render json: FestivalSerializer.new(festival).to_serialized_json
    # end

    # def destroy 
    #     festival = Festival.find(params[:id]).destroy
    #     render json: FestivalSerializer.new(festival).to_serialized_json
    # end 

    private
    def festival_params
        params.require(:festival).permit(:admin_id, :title, :description, :cover_photo, :application_start_date, :application_end_date, :release_date, :video_list)
    end
end
