class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @users
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            @user.budget = Budget.create(food: 0, fun: 0, fuel: 0, gifts: 0, misc: 0)
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

    def destroy
        @user.destroy
        session[:user_id] = nil
        flash[:notice] = "Account and all associated transactions successfully deleted"
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user
           flash[:alert] = "You can only edit your own profile" 
           redirect_to @user 
        end
    end

end