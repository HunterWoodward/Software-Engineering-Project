class ComicsController < ApplicationController

  def require_permission
    if current_user.role != 'Creator'
      redirect_to welcome_path, flash: {alert: "You don't haver permission to do that!"}
    end
  end
  before_action :authenticate_user!
  before_action :require_permission, only:[:new,:create,:edit,:create,:update]

  def show
    comic = Comic.includes(discussion:[:posts]).find(params[:id])
    respond_to do |format|
      format.html {render :show, locals: {comic: comic, discussion: comic.discussion, posts:comic.discussion.posts, reviews:comic.reviews}}
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
    if params[:comic][:is_series] == '1'
      comic = Comic.new(params.require(:comic).permit(:title, :description, :series_id,:issue_number,:cover,:comic_type,pages: []))
      comic.comic_type = "series"
    else
      comic = Comic.new(params.require(:comic).permit(:title, :description,:cover,:comic_type,pages: []))
      comic.comic_type = "oneshot"
    end
    comic.user_id = current_user.id
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
          redirect_to comic_path(comic)
        else 
          flash[:alert] = comic.errors.full_messages.inspect
          render :edit, locals: {comic: comic,pages:comic.pages}
        end
      }
    end
  end
end




