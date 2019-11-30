class ReviewsController < ApplicationController
    def show
        respond_to do |format|
            format.html{render: show}
    end
end
