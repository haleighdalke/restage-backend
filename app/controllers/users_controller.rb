class UsersController < ApplicationController
    before_action :authorized, only: [:persist]

    def new
        user = User.new
    end

    def create 
        user = User.create(user_params)
        if user.valid?
            token = encode_token({user_id: user.id})
            render json: {user: UserSerializer.new(user).to_serialized_json, token: token}
        else
            render json: {error: 'Unable to Create User'}
        end
    end

    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            token = encode_token({user_id: user.id})
            renderAppropriateUser(user, token)
        else 
            render json: {error: 'Incorrect User or Password'}
        end
    end

    def persist
        token = encode_token({user_id: @user.id})
        renderAppropriateUser(@user, token)
    end

    def show
        user = User.find(params[:id])
        render json: UserSerializer.new(user).to_serialized_json
    end

    def update 
        user = User.find(params[:id])
        user.update(user_params)
        render json: UserSerializer.new(user).to_serialized_json
    end

    def destroy 
        user = User.find(params[:id]).destroy
        render json: UserSerializer.new(user).to_serialized_json
    end 

    private
    def user_params
        params.permit(:name, :username, :password)
    end

    def renderAppropriateUser(user, token)
        if user.admins[0] && user.artists[0]
            render json: {user: UserSerializer.new(user).to_serialized_json, token: token, admin: AdminSerializer.new(user.admins[0]).to_serialized_json, artist: ArtistSerializer.new(user.artists[0]).to_serialized_json}
        elsif user.admins[0]
            render json: {user: UserSerializer.new(user).to_serialized_json, token: token, admin: AdminSerializer.new(user.admins[0]).to_serialized_json}
        elsif user.artists[0]
            render json: {user: UserSerializer.new(user).to_serialized_json, token: token, artist: ArtistSerializer.new(user.artists[0]).to_serialized_json}
        else
            render json: {user: UserSerializer.new(user).to_serialized_json, token: token}
        end
    end
end
