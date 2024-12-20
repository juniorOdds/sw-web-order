class ReserveController < ApplicationController
  def index
    @details = Detail.all
  end
  def show
    
  end
  
  def new
    @detail = Detail.new
  end
  
  def create
    @detail = Detail.new(detail_params)
    if @detail.save
      redirect_to reserve_path
    else
      render :new
    end
  end
  
  private
  def detail_params
    params.require(:detail).permit(:reservedName, :reservedDate, :zoneControl, :voltage, :deviceRange, :deviceType)
  end
end
