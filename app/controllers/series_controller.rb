class SeriesController < ApplicationController

  def require_permission
    if current_user.role != 'Creator'
      redirect_to welcome_path, flash: {alert: "You don't haver permission to do that!"}
    end
  end
  before_action :authenticate_user!
  before_action :require_permission, only:[:new,:create,:edit,:create,:update]

  def show
      series = Series.includes(:comics,discussion:[:posts]).find(params[:id])
      respond_to do |format|
        format.html {render :show, locals: {series: series,comics: series.comics,discussion: series.discussion,posts:series.discussion.posts,reviews:series.reviews}}
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
    series.user_id = current_user.id
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

  def edit
    series = Series.find(params[:id])
    respond_to do |format|
      format.html{render :edit, locals:{series: series}}
    end
  end

  def update
    series = Series.find(params[:id])
    respond_to do |format|
      format.html{
        if series.update(params.require(:series).permit(:title,:description,:cover))
          flash[:notice]="Series succesfully updated!"
          redirect_to series_path(series)
        else
          flash[:alert] = series.errors.full_messages.inspect
          render :edit, locals:{series:series}
        end
      }end
    end
end