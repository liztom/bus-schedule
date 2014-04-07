class StationsController < ApplicationController
  def index
    @stations = Station.all
    @station = Station.new
  end

  def create
    @stations = Station.all
    @station = Station.new(station_params)
    if @station.save
      @station.update(:slug => ("#{@station.id}-#{@station.name}").parameterize)
      flash[:notice] = "Your station was added!"
      redirect_to "/stations/#{@station.slug}"
    else
      flash[:alert] = "Try again."
      render 'index'
    end
  end

  def show
    @station = Station.find_by(slug: params[:id])
  end

  def edit
    @station = Station.find_by(slug: params[:id])
  end

  def update
    @station = Station.find(params[:id])
    if @station.update(station_params)
      @station.update(:slug => ("#{@station.id}-#{@station.name}").parameterize)
      flash[:notice] = "Your station was successfully updated!"
      redirect_to "/stations/#{@station.slug}"
    else
      flash[:alert] = "Please try again."
      render 'index'
    end
  end

  def destroy
    @station = Station.find(params[:id])
    Stop.destroy_all "station_id = #{@station.id}"
    @station.destroy
    redirect_to :root
  end

  private

  def station_params
    params.require(:station).permit(:name, :slug)
  end
end
