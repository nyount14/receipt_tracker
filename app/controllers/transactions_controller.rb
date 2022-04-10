class TransactionsController < ApplicationController
    before_action :find_by_id, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index, :home]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def home
        redirect_to current_user if logged_in?
    end

    def about
    end
    
    def index
        @transactions = Transaction.paginate(page: params[:page], per_page: 10).order('date DESC')
    end

    def new
        @transaction = Transaction.new
    end

    def create
        @transaction = Transaction.new(whitelist)
        @transaction.user = current_user
        if @transaction.save && current_user.budget[@transaction.category]
            current_user.budget[@transaction.category] = current_user.budget[@transaction.category] - @transaction.amount
            current_user.budget.save
            flash[:notice] = "Transaction added successfully"
            redirect_to @transaction.user
        else
            render "new"
        end
    end

    def edit

    end

    def show
        
    end

    def update
        if @transaction.update(whitelist)
            flash[:notice] = "Transaction was updated successfully"
            redirect_to transactions_path
        else
            render 'edit'
        end
    end

    def destroy
        @transaction.destroy
        redirect_to @transaction.user
    end

    private

    def find_by_id
        @transaction = Transaction.find(params[:id])
    end

    def require_same_user
        if current_user != @transaction.user
           flash[:alert] = "You can only edit or delect your own transactions" 
           redirect_to @transaction 
        end
    end

    def whitelist
        params.require(:transaction).permit(:amount, :date, :category, :payment_method, :description)
    end
end
