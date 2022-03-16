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
        @transaction = Transaction.new(params.require(:transaction).permit(:amount, :t_type, :date))
        if @transaction.save
            flash[:notice] = "Transaction added successfully"
            redirect_to transactions_path
        else
            render "new"
        end
    end

    def show
        @transaction = Transaction.find(params[:id])
    end

    def edit
        @transaction = Transaction.find(params[:id])
    end

    def update
        @transaction = Transaction.find(params[:id])
        if @transaction.update(params.require(:transaction).permit(:amount, :t_type, :date))
            flash[:notice] = "Transaction was updated successfully"
            redirect_to transactions_path
        else
            render 'edit'
        end
    end

    def destroy
        @transaction = Transaction.find(params[:id])
        @transaction.destroy
        redirect_to transactions_path
    end
end
