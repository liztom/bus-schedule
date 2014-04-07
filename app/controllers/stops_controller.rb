class StopsController < ApplicationController
  def index
    @stops = Stop.all
    @stop = Stop.new
    @lines = Line.all
    @stations = Station.all
  end

  def create
    @stops = Stop.all
    @stop = Stop.new(stop_params)
    if @stop.save
      flash[:notice] = "Your stop was added!"
      redirect_to stops_path
    else
      flash[:alert] = "Try again."
      render 'index'
    end
  end

  def show
    @stop = Stop.find(params[:id])
  end

  def edit
    @stop = Stop.find(params[:id])
    @lines = Line.all
    @stations = Station.all
  end

  def update
    @stop = Stop.find(params[:id])
    if @stop.update(stop_params)
      flash[:notice] = "Your stop was successfully updated!"
      redirect_to stops_path
    else
      flash[:alert] = "Please try again."
      render 'index'
    end
  end

  def destroy
    @stop = Stop.find(params[:id])
    @stop.destroy
    redirect_to :root
  end

  private

  def stop_params
    params.require(:stop).permit(:stoptime, :line_id, :station_id)
  end
end
