class ReviewsController < ApplicationController
    def show
        review = Review.includes(:critic,:discussion).find(params[:id])
        respond_to do |format|
            format.html{render :show, locals:{review: review}}
        end
    end
end
