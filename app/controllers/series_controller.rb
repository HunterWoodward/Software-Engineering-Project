class SeriesController < ApplicationController

  before_action :authenticate_user!

  def show
      series = Series.includes(:comics).find(params[:id])
      respond_to do |format|
        format.html {render :show, locals: {series: series,comics: series.comics}}
      end
    end

  def new
    series = Series.new
    respond_to do |format|
      format.html {render :new, locals:{series: series}}
    end
  end

  def create
    series=Series.new(params.require(:series).permit(:title,:description ,:cover))
    respond_to do |format|
      format.html{
        if series.save
          flash[:notice] = "Series succesfully published"
          redirect_to series_path(id: series.id)
        else
          flash.now[:alert] = series.errors.full_messages.inspect
          render :new, locals: {series: series}
        end
      }
    end
  end
end