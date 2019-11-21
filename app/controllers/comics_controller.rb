class ComicsController < ApplicationController

  before_action :authenticate_user!

  def show
    comic = Comic.find(params[:id])
    respond_to do |format|
      format.html {render :show, locals: {comic: comic}}
    end
  end

  def new
    comic = Comic.new
    respond_to do |format|
      format.html {render :new, locals: {comic: comic}}
    end
  end

  def create
  end


  
end
