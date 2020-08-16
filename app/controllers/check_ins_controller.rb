class CheckInsController < ApplicationController
    before_action :set_check_in, except: [:index, :create]

    def index 
        check_ins = CheckIn.order("created_at DESC")
        render json: {
            check_in: CheckInSerializer.new(check_ins).serializable_hash
        }
    end

    def show 
        render json: {
            check_in: CheckInSerializer.new(@check_in).serializable_hash
        }
    end

    def create 
        check_in = CheckIn.new(check_in_params)
        if check_in.save 
            render json: {
                check_in: CheckInSerializer.new(check_in).serializable_hash,
                message: "#{check_in.name} has been checked in successfully"
            }
        end
    end

    def update
        if @check_in.update(check_in_params)
            render json: {
                check_in: CheckInSerializer.new(@check_in).serializable_hash,
                message: "#{@check_in.name}'s check in info has been updated successfully"
            }
        end
    end

    def destroy
        @check_in.destroy
        render json: {
            check_in: CheckInSerializer.new(@check_in).serializable_hash,
            message: "#{@check_in.name}'s check in info has been deleted succesfully"
        }
    end

    private 

    def check_in_params 
        params.require(:check_in).permit(:name, :time_in, :time_out,  :num_of_visits, :remarks_post_visit)
    end

    def set_check_in 
        @check_in = CheckIn.find(params[:id])
    end

end
