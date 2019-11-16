class PagesController < ApplicationController
    def show
        comic = Comic.includes(:pages).find(params[:id])
        page = comic.pages.find_by_page_number(params[:page])
            respond_to do |format|
        format.html {render :show, locals: {comic: comic, page: page}}
        end 
    end
end
