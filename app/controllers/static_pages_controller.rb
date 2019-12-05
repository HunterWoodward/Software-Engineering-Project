class StaticPagesController < ApplicationController

    def require_permission
        if current_user.role != 'Critic'
          redirect_to welcome_path, flash: {alert: "You don't haver permission to do that!"}
        end
      end
    before_action :authenticate_user!
    before_action :require_permission, only:[:reccomend]

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
            series = Series.where('title like?', "%"+params[:title].downcase+"%")
            series.each do |s|
                reviews = s.reviews
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

    def show_my_comics
        comics = current_user.comics
        series = current_user.series
        respond_to do |format|
            format.html {render :mycomics, locals: {comics: comics, series: series}}
        end
    end

    def show_my_reviews
        critic = User.includes(:reviews,:reccomendations).find(current_user.id)
        comics = []
        critic.reccomendations.each do |r|
            comics.push(Comic.find(r.comic_id))
        end
        respond_to do |format|
            format.html {render :critic , locals:{critic: critic, reviews: critic.reviews, comics: comics}}
        end
    end

    def show_critic
        critic = User.includes(:reviews,:reccomendations).find(params[:id])
        comics = []
        critic.reccomendations.each do |r|
            comics.push(Comic.find(r.comic_id))
        end
        respond_to do |format|
            format.html {render :critic , locals:{critic: critic, reviews: critic.reviews, comics: comics}}
        end
    end

    def show_creator
        creator = User.includes(:comics,:series).find(params[:id])
        respond_to do |format|
            format.html {render :creator , locals:{creator: creator, comics: creator.comics, series: creator.series}}
        end
    end

    def reccomend
        comic = Comic.find(params[:id])
        recc = current_user.reccomendations.build(comic_id: comic.id)
        if recc.save
            flash[:notice] = "Reccomendation Created Succesfully!"
        else
            flash[:alert] = recc.errors.full_messages.inspect
        end
        redirect_to comic_path(comic.id)
    end


    def unreccomend
        recc = Reccomendation.find_by(user_id: current_user.id, comic_id: params[:id])
        recc.destroy
        respond_to do |format|
            format.html{
                flash[:notice] = "Recommendation removed successfully!"
                redirect_to comic_path(params[:id])
            }
        end
    end
    
end
