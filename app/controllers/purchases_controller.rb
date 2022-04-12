class PurchasesController < ApplicationController
    before_action :find_by_id, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:home]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    
    def index
        # @purchases = Purchase.paginate(page: params[:page], per_page: 10).order('date DESC')
        redirect_to current_user if logged_in?
    end

    def new
        @purchase = Purchase.new
    end
   
    def create
        @purchase = Purchase.new(whitelist)
        @purchase.user = current_user
        if @purchase.save && current_user.budget[@purchase.category]
            current_user.budget[@purchase.category] = current_user.budget[@purchase.category] - @purchase.amount
            current_user.budget.save
            flash[:notice] = "Purchase added successfully"
            redirect_to @purchase.user
        else
            render "new"
        end
    end

    def edit

    end

    def update
        if @purchase.update(whitelist)
            flash[:notice] = "Transaction was updated successfully"
            redirect_to @purchase.user
        else
            render 'edit'
        end
    end

    def show
        @purchases = @user.purchases.paginate(page: params[:page], per_page: 10).order('date DESC')
    end

    def destroy
        @purchase.destroy
        redirect_to @purchase.user
    end

    private

    def find_by_id
        @purchase = Purchase.find(params[:id])
    end

    def require_same_user
        if current_user != @purchase.user
           flash[:alert] = "You can only edit or delect your own Purchases" 
           redirect_to @purchase 
        end
    end

    def whitelist
        params.require(:purchase).permit(:amount, :date, :category, :payment_method, :description, reason_ids: [])
    end
end
