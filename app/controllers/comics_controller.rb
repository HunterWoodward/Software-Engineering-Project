class ComicsController < ApplicationController
  def show
    comic = Comic.find(params[:id])
    respond_to do |format|
      format.html {render :show, locals: {comic: comic}}
    end
  end
end
