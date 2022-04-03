class TransactionsController < ApplicationController
    before_action :find_by_id, only: [:show, :edit, :update, :destroy]
    
    def home
        redirect_to transactions_path if logged_in?
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
        if @transaction.save
            flash[:notice] = "Transaction added successfully"
            redirect_to transactions_path
        else
            render "new"
        end
    end

    def show
    end

    def edit
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
        redirect_to transactions_path
    end

    private

    def find_by_id
        @transaction = Transaction.find(params[:id])
    end

    def whitelist
        params.require(:transaction).permit(:amount, :t_type, :date, :category)
    end
end
