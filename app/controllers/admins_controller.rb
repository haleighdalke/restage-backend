class AdminsController < ApplicationController
    # def index 
    #     admins = Admin.all
    #     render json: admins
    # end

    def new
        admin = Admin.new
    end

    def create 
        admin = Admin.create(admin_params)
        render json: AdminSerializer.new(admin)
    end

    def show
        admin = Admin.find(params[:id])
        render json: AdminSerializer.new(admin)
    end

    # def edit
    #     admin = Admin.find(params[:id])
    # end

    # def update 
    #     admin = Admin.find(params[:id])
    #     Admin.update(admin_params)
    #     render json: AdminSerializer.new(admin)
    # end

    # def destroy 
    #     admin = Admin.find(params[:id]).destroy
    #     render json: AdminSerializer.new(admin)
    # end 

    private
    def admin_params
        params.require(:admin).permit(:user_id, :company_title, :bio, :photo)
    end
end
