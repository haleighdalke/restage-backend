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

        piece = Piece.create(piece_params)
        byebug

        # don't save in active storage (save in api)
        piece.upload_trailer(params[:short_video])
        piece.upload_full_video(params[:long_video])

        piece.save

        # save in active storage
        piece.update(cover_photo: url_for(piece.image))

        byebug
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
        params.permit(:artist_id, :festival_id, :title, :description, :image, :short_video, :long_video, :cover_photo)
    end

end
