class ArtistsController < ApplicationController
    def index 
        # added with_attached_headshot
        artists = Artist.all.with_attached_headshot
        render json: ArtistSerializer.new(artists).to_serialized_json
    end

    def new
        artist = Artist.new
    end

    def create 

        artist = Artist.create(artist_params)
        # headshot = url_for(artist.headshot)
        render json: {user: artist.user, company_title: artist.company_title, bio: artist.bio, photo: artist.photo, headshot: artist.headshot_blob}
    end

    def show
        artist = Artist.find(params[:id])
        render json: {user: artist.user, company_title: artist.company_title, bio: artist.bio, photo: artist.photo, headshot: artist.headshot_blob}
    end

    def edit
        artist = Artist.find(params[:id])
    end

    def update 
        artist = Artist.find(params[:id])
        Artist.update(artist_params)
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
