class FoodBudgetsController < ApplicationController
    before_action :find_by_id, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index, :home]
    before_action :require_same_user, only: [:edit, :update, :destroy]


    def index
        @food_budgets = FoodBudget.all
    end

    def new
        @food_budget = FoodBudget.new
    end

    def create
        @food_budget = FoodBudget.new(whitelist)
        @food_budget.user = current_user
        if @food_budget.save
            flash[:notice] = "Budget amount saved successfully"
            redirect_to food_budgets_path
        else
            render "new"
        end
    end

    def edit
        
    end

    def show
        
    end

    def update
        
    end

    def destroy
        
    end

private

def find_by_id
    @food_budget = FoodBudget.find(params[:id])
end

def require_same_user
    if current_user != @food_budget.user
       flash[:alert] = "You can only edit or delect your own food budget" 
       redirect_to @food_budget
    end
end

def whitelist
    params.require(:food_budget).permit(:amount)
end


end