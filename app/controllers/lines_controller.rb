class LinesController < ApplicationController
  def index
    @lines = Line.all
    @line = Line.new
  end

  def create
    @lines = Line.all
    @line = Line.new(line_params)
    if @line.save
      @line.update(:slug => ("#{@line.id}-#{@line.name}").parameterize)
      flash[:notice] = "Your line was added!"
      redirect_to "/lines/#{@line.slug}"
    else
      flash[:alert] = "Try again."
      render 'index'
    end
  end

  def show
    @line = Line.find_by(slug: params[:id])
  end

  def edit
    @line = Line.find_by(slug: params[:id])
  end

  def update
    @line = Line.find(params[:id])
    if @line.update(line_params)
      @line.update(:slug => ("#{@line.id}-#{@line.name}").parameterize)
      flash[:notice] = "Your line was successfully updated!"
      redirect_to "/lines/#{@line.slug}"
    else
      flash[:alert] = "Please try again."
      render 'index'
    end
  end

  def destroy
    @line = Line.find(params[:id])
    Stop.destroy_all "line_id = #{@line.id}"
    @line.destroy
    redirect_to lines_path
  end

  private

  def line_params
    params.require(:line).permit(:name, :slug)
  end
end
