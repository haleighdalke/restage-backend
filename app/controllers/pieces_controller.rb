class PiecesController < ApplicationController
    include Rails.application.routes.url_helpers

    def index 
        pieces = Piece.all
        render json: PieceSerializer.new(pieces).to_serialized_json
    end

    def new
        piece = Piece.new
    end

    def create 
        # UPLOAD VIDEO FUNCTIONALITY (not working)
            # 1st try: send meta file data directly from params => upload_trailer method in model => quickstart.rb method => api request
            # current try: upload file to active storage and send url to upload_trailer => quickstart.rb method => api request

        # piece = Piece.create(piece_params)
        # byebug

        # url = url_for(piece.short_video)

        # piece.upload_trailer(url)
        # piece.upload_full_video(params[:long_video])

        # piece.save

        # # save in active storage
        # piece.update(cover_photo: url_for(piece.image))

        piece = Piece.create(piece_params)
        piece.update(cover_photo: url_for(piece.image))
        render json: PieceSerializer.new(piece).to_serialized_json
    end

    def show
        piece = Piece.find(params[:id])
        render json: PieceSerializer.new(piece).to_serialized_json
    end

    # def edit
    #     piece = Piece.find(params[:id])
    # end

    # def update 
    #     piece = Piece.find(params[:id])
    #     Piece.update(piece_params)
    #     render json: PieceSerializer.new(piece).to_serialized_json
    # end

    # def destroy 
    #     piece = Piece.find(params[:id]).destroy
    #     render json: PieceSerializer.new(piece).to_serialized_json
    # end 

    private

    def piece_params
        params.permit(:artist_id, :festival_id, :title, :description, :image, :trailer_id, :full_video_id, :cover_photo)
    end

end
