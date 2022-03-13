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

    def show
        @transaction = Transaction.find(params[:id])
    end
end
