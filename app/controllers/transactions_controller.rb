class TransactionsController < ApplicationController
    def home

    end

    def about

    end
    
    def index
        @transactions = Transaction.all
    end

    def new
        
    end

    def create
        @transaction = Transaction.new(params.require(:transaction).permit(:amount, :transaction_type))
        @transaction.save
        redirect_to @transaction
    end

    def show
        @transaction = Transaction.find(params[:id])
    end
end
