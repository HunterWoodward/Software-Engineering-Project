class StaticPagesController < ApplicationController

    before_action :authenticate_user!

    def index
        comics = Comic.all
        reviews = Review.all
        respond_to do |format|
            format.html {render :index, locals: {comics: comics,reviews:reviews}}
        end
    end

    def filter
        if (params.has_key? :title and not params[:title].blank?)
            comics = Comic.where('title like?', "%"+params[:title].downcase+"%")
            reviews = []
            comics.each do |c|
                reviews = c.reviews
            end
        elsif (params.has_key? :author and not params[:author].blank?)
            name = params[:author].split(" ")
            comics = Comic.joins(:author).where('first_name LIKE ? OR last_name LIKE ?', "%#{name[0]}%","%#{name[1]}%")
            reviews = Review.joins(:critic).where('first_name LIKE ? OR last_name LIKE ?', "%#{name[0]}%","%#{name[1]}%")
        else
            comics = Comic.all
            reviews = Review.all
        end


        if params[:search_type] == "Review"
            respond_to do |format|
                format.html {render :index, locals: {reviews:reviews}}
            end
        elsif params[:search_type] == "Comic"
            respond_to do |format|
                format.html {render :index, locals: {comics:comics}}
            end
        else
            respond_to do |format|
                format.html {render :index, locals: {comics:comics,reviews:reviews}}
            end
        end
    end
end
