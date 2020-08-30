class PiecesController < ApplicationController
    def index 
        pieces = Piece.all
        render json: PieceSerializer.new(pieces).to_serialized_json
    end

    def new
        piece = Piece.new
    end

    def create 
        piece = Piece.create(piece_params)
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
        params.require(:piece).permit(:artist_id, :festival_id, :title, :cover_photo, :description, :trailer_id, :full_video_id)
    end
end
