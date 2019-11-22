class ComicsController < ApplicationController

  before_action :authenticate_user!

  def show
    comic = Comic.find(params[:id])
    respond_to do |format|
      format.html {render :show, locals: {comic: comic}}
    end
  end

  def new
    series = Series.all
    comic = Comic.new
    respond_to do |format|
      format.html {render :new, locals: {comic: comic, series:series}}
    end
  end

  def create
    series = Series.all
    if !params[:comic][:series_id].nil?
      comic = Comic.new(params.require(:comic).permit(:title, :description, :series_id,:issue_number,:cover,:comic_type,pages: []))
      comic.comic_type = "series"
    else
      comic = Comic.new(params.require(:comic).permit(:title, :description,:cover,:comic_type,pages: []))
      comic.comic_type = "oneshot"
    end
    respond_to do |format|
      format.html{
        if comic.save
          flash[:notice] = "Comic succesfully published!"
          redirect_to browse_path
        else
          flash.now[:alert] = comic.errors.full_messages.inspect
          render :new, locals: {comic: comic,seris:series}
        end
      }
    end
  end

  def edit
    comic = Comic.includes(:pages).find(params[:id])
    respond_to do |format|
      format.html{render :edit, locals:{comic:comic,pages:comic.pages}}
    end
  end

  def update
    comic = Comic.includes(:pages).find(params[:id])
    respond_to do |format|
    format.html{
        if comic.update(params.require(:comic).permit(:title,:cover,:description))
          flash[:notice] = "Comic succesfully Updated!"
          redirect_to browse_path
        else 
          flash.now[:alert] = comic.errors.full_messages.inspect
          render :edit, locals: {comic: comic,pages:comic.pages}
        end
      }
    end
  end


end




