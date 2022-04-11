class ReasonsController < ApplicationController
    def new
        @reason = Reason.new
    end

    def create
        @reason = Reason.new(reason_params)
        if @reason.save
            flash[:notice] = "New reason for purchase was created successfully"
            redirect_to reasons_path
        else
            render 'new'
        end
    end

    def show
        @reason = Reason.find(params[:id])
    end

    def index
        @reasons = Reason.paginate(page: params[:page], per_page: 8)
    end

    private

    def reason_params
        params.require(:reason).permit(:option)
    end

end