class TransactionsController < ApplicationController
    def home

    end

    def about

    end
    
    def index
        @transactions = Transaction.all
    end

    def show

    end
end
