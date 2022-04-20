class PurchasesController < ApplicationController
    before_action :find_by_id, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:home]
    before_action :require_same_user, only: [:show, :edit, :update, :destroy]
    
    

    # def index
    #     @purchases = Purchase.current_user
    # end

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
            flash[:alert] = "Purchase was not added.  Try again"
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
       
    end


    def destroy
        @purchase.destroy
        filter
        if @params == "Amazon CC"
                @purchases = @user.purchases.amazon.paginate(page: params[:page], per_page: 3).order('created_at DESC')
                # redirect_to @purchase.payment_method.amazon.user
            elsif @params == "Freedom CC"
                @purchases = @user.purchases.freedom.paginate(page: params[:page], per_page: 3).order('created_at DESC')
                # redirect_to @purchase.payment_method.freedom.user
            elsif @params == "cash"
                @purchases = @user.purchases.cash.paginate(page: params[:page], per_page: 3).order('created_at DESC')
                # redirect_to @purchase.payment_method.cash.user
            else
                redirect_to @purchase.user
        end

        # if amazon
        







        # redirect_to @purchases.amazon
        # else
        #     redirect_to @purchase.user
        # end

    end

    private

    def find_by_id
        @purchase = Purchase.find(params[:id])
    end

    def require_same_user
        if current_user != @purchase.user
           flash[:alert] = "You can only edit or delect your own Purchases" 
           redirect_to current_user 
        end
    end

    def whitelist
        params.require(:purchase).permit(:amount, :date, :category, :payment_method, :description, reason_ids: [])
    end
end
