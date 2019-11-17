class StaticPagesController < ApplicationController
    def index
        comics = Comic.all
        respond_to do |format|
            format.html {render :index, locals: {comics: comics}}
        end
    end

    def filter
        if params.has_key? :title and not params[:title].blank?
            comics = Comic.where('title like ?', "%#{params[:title].downcase}%")
        else
            comics = Comic.all
        end
        respond_to do |format|
            format.html {render :index, locals: {comics: comics}}
        end    
    end
end
