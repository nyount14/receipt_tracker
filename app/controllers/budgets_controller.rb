class BudgetsController < ApplicationController
    before_action :find_by_id, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index, :home]
    before_action :require_same_user, only: [:edit, :update, :destroy]


    def index
        @budgets = Budget.all
    end

    def new
        @budget = Budget.new
    end

    def create
        @budget = Budget.new(whitelist)
        @budget.user = current_user
        if @budget.save
            flash[:notice] = "Budget amount saved successfully"
            redirect_to budgets_path
        else
            render "new"
        end
    end

    def edit
        
    end

    def show
        
    end

    def update
        if @budget.update(whitelist)
            flash[:notice] = "Transaction was updated successfully"
            redirect_to budgets_path
        else
            render 'edit'
        end
        
    end

    def destroy
        @budget.destroy
        redirect_to budgets_path
    end

private

def find_by_id
    @budget = Budget.find(params[:id])
end

def require_same_user
    if current_user != @budget.user
       flash[:alert] = "You can only edit or delect your own food budget" 
       redirect_to @budget
    end
end

def whitelist
    params.require(:budget).permit(:food, :fun, :fuel, :gifts, :misc)
end


end