class StoptimesController < ApplicationController

  def create
    @stoptimes = Stoptime.all
    @stoptime = Stoptime.new(stoptime_params)
    if @stoptime.save
      flash[:notice] = "Your time was added!"
      redirect_to stops_path
    else
      flash[:alert] = "Try again."
      render 'index'
    end
  end

  def destroy
    @stoptime = Stoptime.find(params[:id])
    @stoptime.destroy
    redirect_to :root
  end

  private

  def stoptime_params
    params.require(:stoptime).permit(:name, :bus_id, :stop_id)
  end
end
