class UsersController < ApplicationController
    before_action :find_by_id, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:index, :show, :edit, :update]
    before_action :require_same_user, only: [:show, :edit, :update, :destroy]

    def index
        @purchases = @user.purchases
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            @user.budget = Budget.create(food: 0, fun: 0, fuel: 0, gifts: 0, misc: 0)
            flash[:notice] = "Welcome #{@user.username}.  You have successfully signed up for Virtual Wallet.  Set your budget amounts so you can begin to add purchases."
            redirect_to user_path(current_user)
        else
            render 'new'
        end
    end

    def edit

    end

    def update
        if @user.update(user_params)
            flash[:notice] = "Your account information was successfully updated"
            redirect_to user_path(current_user)
        else
            render 'edit'
        end
    end

    def show
        @purchases = @user.purchases.paginate(page: params[:page], per_page: 3).order('created_at DESC')
        # if params[:search] == "Amazon CC"
        #         @purchases = @user.purchases.amazon.paginate(page: params[:page], per_page: 3).order('created_at DESC')
        #     elsif params[:search] == "Freedom CC"
        #         @purchases = @user.purchases.freedom.paginate(page: params[:page], per_page: 3).order('created_at DESC')
        #     elsif params[:search] == "cash"
        #         @purchases = @user.purchases.cash.paginate(page: params[:page], per_page: 3).order('created_at DESC')
        #     else
        #         @purchases = @user.purchases.paginate(page: params[:page], per_page: 3).order('created_at DESC')
        # end

        # if params[:search]
        #     paymentmethod = params[:search]
        #     @purchases = @user.purchases.paymentmethod
        # else
        #     @purchases = @user.purchases
        # end



    end


    def destroy
        @user.destroy
        session[:user_id] = nil
        flash[:notice] = "Account and all associated purchases successfully deleted"
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def find_by_id
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user
           flash[:alert] = "You can only view or edit your own profile" 
           redirect_to current_user
        end
    end

    def purchase_params
        params.require(:purhase).permit(:purchase_method)
    end

end