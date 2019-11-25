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
    comic = Comic.new(params.require(:comic).permit(:title, :description,:cover,:comic_type,pages: []))
    comic.comic_type = "oneshot"
    respond_to do |format|
      format.html{
        if comic.save
          flash[:notice] = "Comic succesfully published!"
          redirect_to browse_path
        else
          flash.now[:alert] = comic.errors.full_messages.inspect
          render :new, locals: {comic: comic}
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




