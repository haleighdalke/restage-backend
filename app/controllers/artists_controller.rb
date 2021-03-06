class ArtistsController < ApplicationController
    include Rails.application.routes.url_helpers

    def index 
        artists = Artist.all
        render json: ArtistSerializer.new(artists).to_serialized_json
    end

    def new
        artist = Artist.new
    end

    def create 
        artist = Artist.create(artist_params)

        # assign photo to the headshot URL for rendering
        artist.update(photo: url_for(artist.headshot))
        render json: ArtistSerializer.new(artist).to_serialized_json
    end

    def show
        artist = Artist.find(params[:id])
        render json: ArtistSerializer.new(artist).to_serialized_json
    end

    def edit
        artist = Artist.find(params[:id])
    end

    def update 
        artist = Artist.find(params[:id])
        artist.update(artist_params)
        render json: ArtistSerializer.new(artist).to_serialized_json
    end

    # def destroy 
    #     artist = Artist.find(params[:id]).destroy
    #     render json: ArtistSerializer.new(artist).to_serialized_json
    # end 

    private
    def artist_params
        params.permit(:user_id, :company_title, :bio, :photo, :headshot)
    end
end
