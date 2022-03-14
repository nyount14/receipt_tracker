class TransactionsController < ApplicationController
    def home

    end

    def about

    end
    
    def index
        @transactions = Transaction.all
    end

    def new
        @transaction = Transaction.new
    end

    def create
        @transaction = Transaction.new(params.require(:transaction).permit(:amount, :transaction_type))
        if @transaction.save
            flash[:notice] = "Transaction added successfully"
            redirect_to @transaction
        else
            render "new"
        end
    end

    def show
        @transaction = Transaction.find(params[:id])
    end
end
