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
      print("S")
      redirect_to index_path, notice: 'reserve was successfully.'
    else
      print("F")
      render :new
    end
  end
  
  private
  def detail_params
    params.require(:detail).permit(:reservedName, :start_time, :zoneControl, :voltage, :deviceRange, :deviceType)
  end
end
