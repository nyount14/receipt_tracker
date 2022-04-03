class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]

    def index
        @users = User.paginate(page: params[:page], per_page: 10) 
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome #{@user.username}.  You have successfully signed up for Virtual Wallet"
            redirect_to transactions_path
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "Your account information was successfully updated"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def show
        @transactions = @user.transactions.paginate(page: params[:page], per_page: 10).order('date DESC')
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def destroy   
    end

end