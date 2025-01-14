class ReserveController < ApplicationController
  def index 
    @details = Detail.all
    @keycloak_url = "http://localhost:8080/realms/SW_ORDER/protocol/openid-connect/auth?client_id=sw_order_localhost&redirect_uri=http://localhost:3000/callback&response_type=code&scope=openid"

  end
  def callback
    @code = params[:code]
    Rails.logger.info "Code received: #{@code}"
    redirect_to root_path

  end
  def show
    
  end
  
  def new
    @detail = Detail.new

    if params[:date].present?
      @detail.start_time = params[:date]
    end 
    Rails.logger.info "Date received: #{params[:date]}"

    


  end
  
  def create
    @detail = Detail.new(detail_params) 

    if @detail.save
      redirect_to index_path, notice: "Reservation was successfully created."
    else
      flash.now[:alert] = "Failed to create reservation. Please try again."
      render :new
    end
  end
  
  private
  def detail_params

    params.require(:detail).permit(:reservedName, :start_time,:zoneControl, :voltage, :deviceRange, :deviceType, :start_time)
  end
end
