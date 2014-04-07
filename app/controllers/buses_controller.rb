class BusesController < ApplicationController
  def index
    @buses = Bus.all
    @bus = Bus.new
    @lines = Line.all
  end

  def create
    @buses = Bus.all
    @bus = Bus.new(bus_params)
    if @bus.save
      @bus.update(:slug => ("#{@bus.id}-#{@bus.name}").parameterize)
      flash[:notice] = "Your bus was added!"
      redirect_to buses_path
    else
      flash[:alert] = "Try again."
      render 'index'
    end
  end

  def show
    @bus = Bus.find(params[:id])
  end

  def edit
    @bus = Bus.find(params[:id])
    @lines = Line.all
    @stations = Station.all
  end

  def update
    @bus = Bus.find(params[:id])
    if @bus.update(bus_params)
      flash[:notice] = "Your bus was successfully updated!"
      redirect_to buses_path
    else
      flash[:alert] = "Please try again."
      render 'index'
    end
  end

  def destroy
    @bus = Bus.find(params[:id])
    @bus.destroy
    redirect_to :root
  end

  private

  def bus_params
    params.require(:bus).permit(:line_id, :name)
  end
end
