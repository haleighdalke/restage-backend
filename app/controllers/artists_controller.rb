class ArtistsController < ApplicationController
    def index 
        artists = Artist.all
        render json: artists
    end

    def new
        artist = Artist.new
    end

    def create 
        artist = Artist.create(artist_params)
        render json: ArtistSerializer.new(artist)
    end

    def show
        artist = Artist.find(params[:id])
        render json: ArtistSerializer.new(artist)
    end

    def edit
        artist = Artist.find(params[:id])
    end

    def update 
        artist = Artist.find(params[:id])
        Artist.update(artist_params)
        render json: ArtistSerializer.new(artist)
    end

    # def destroy 
    #     artist = Artist.find(params[:id]).destroy
    #     render json: ArtistSerializer.new(artist)
    # end 

    private
    def artist_params
        params.require(:artist).permit(:user_id, :company_title, :bio, :photo)
    end
end
