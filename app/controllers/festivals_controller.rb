class FestivalsController < ApplicationController
    def index 
        festivals = Festival.all
        render json: festivals
    end

    def new
        festival = Festival.new
    end

    def create 
        festival = Festival.create(festival_params)
        render json: FestivalSerializer.new(festival)
    end

    def show
        festival = Festival.find(params[:id])
        render json: FestivalSerializer.new(festival)
    end

    # def edit
    #     festival = Festival.find(params[:id])
    # end

    # def update 
    #     festival = Festival.find(params[:id])
    #     Festival.update(festival_params)
    #     render json: FestivalSerializer.new(festival)
    # end

    # def destroy 
    #     festival = Festival.find(params[:id]).destroy
    #     render json: FestivalSerializer.new(festival)
    # end 

    private
    def festival_params
        params.require(:festival).permit(:admin_id, :title, :description, :cover_photo, :application_start_date, :application_end_date, :release_date, :video_list)
    end
end
