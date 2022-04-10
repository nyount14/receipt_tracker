class ReasonsController < ApplicationController
    def new
        @reason = Reason.new
    end

    def create
        @reason = Reason.new(reason_params)
        if @reason.save
            flash[:notice] = "New Reason created successfully"
            redirect_to @reason
        else
            render 'new'
        end
    end

    def show

    end

    def index

    end

    private

    def reason_params
        params.require(:reason).permit(:option)
    end

end