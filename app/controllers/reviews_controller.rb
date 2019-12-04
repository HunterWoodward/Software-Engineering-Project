class ReviewsController < ApplicationController
    def require_permission
        if current_user.role != 'Critic'
          redirect_to welcome_path, flash: {alert: "You don't haver permission to do that!"}
        end
    end
      before_action :authenticate_user!
      before_action :require_permission, only:[:new_comic_review,:new_series_review,:create_comic_review,:create_series_review]
    def show
        review = Review.includes(:critic,:discussion).find(params[:id])
        respond_to do |format|
            format.html{render :show, locals:{review: review}}
        end
    end

    def new_comic_review
        comic = Comic.find(params[:id])
        respond_to do |format|
            format.html {render :new, locals: {object: comic, review: comic.reviews.build}}
        end
    end

    def create_comic_review
        comic = Comic.find(params[:id])
        review = comic.reviews.build(params.require(:review).permit(:title,:body,:rating))
        review.rating = params[:rating]
        review.user_id = current_user.id
        respond_to do |format|
            format.html{
                if review.save
                    flash[:notice]= "Review created succesfully!"
                    redirect_to review_path(review)
                else
                    flash[:alert]= review.errors.full_messages.inspect
                    render :new, locals: {object: comic, review: review}
                end
            }
        end
    end

    def new_series_review
        series = Series.find(params[:id])
        respond_to do |format|
            format.html {render :new, locals: {object: series, review: series.reviews.build}}
        end
    end

    def create_series_review
        series = Series.find(params[:id])
        review = series.reviews.build(params.require(:review).permit(:title,:body,:rating))
        review.rating = params[:rating]
        review.user_id = current_user.id
        respond_to do |format|
            format.html{
                if review.save
                    flash[:notice]= "Review created succesfully!"
                    redirect_to review_path(review)
                else
                    flash[:alert]= review.errors.full_messages.inspect
                    render :new, locals: {object: series, review: review}
                end
            }
        end
    end
end
