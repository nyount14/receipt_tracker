class UsersController < ApplicationController
    before_action :find_by_id, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome #{@user.username}.  You have successfully signed up for Virtual Wallet"
            redirect_to transactions_path
        else
            render 'new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "Your account information was successfully updated"
            redirect_to transactions_path
        else
            render 'edit'
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def find_by_id
        @user = User.find(params[:id])
    end

end