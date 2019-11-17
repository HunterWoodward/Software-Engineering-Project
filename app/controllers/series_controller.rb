class SeriesController < ApplicationController
  def show
      series = Series.includes(:comics).find(params[:id])
      respond_to do |format|
        format.html {render :show, locals: {series: series,comics: series.comics}}
      end
    end
  end
