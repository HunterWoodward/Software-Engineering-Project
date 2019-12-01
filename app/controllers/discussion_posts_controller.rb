class DiscussionPostsController < ApplicationController
    def create_comic_post
        discussion = Discussion.find(params[:id])
        post = discussion.posts.build(params.require(:post).permit(:body))
        post.user_id = current_user.id
        respond_to do |format|
            format.html{
                if post.save
                    flash[:notice] = "Post succesfully Published"
                    redirect_to comic_path(id: discussion.comic_id)
                else
                    flash[:alert] = post.errors.full_messages.inspect
                    redirect_to comic_path(id: discussion.comic_id)
                end
            }
        end
    end

    def create_series_post
        discussion = Discussion.find(params[:id])
        post = discussion.posts.build(params.require(:post).permit(:body))
        post.user_id = current_user.id
        respond_to do |format|
            format.html{
                if post.save
                    flash[:notice] = "Post succesfully Published"
                    redirect_to series_path(id: discussion.series_id)
                else
                    flash[:alert] = post.errors.full_messages.inspect
                    redirect_to series_path(id: discussion.series_id)
                end
            }
        end
    end

    def create_review_post
        discussion = Discussion.find(params[:id])
        post = discussion.posts.build(params.require(:post).permit(:body))
        post.user_id = current_user.id
        respond_to do |format|
            format.html{
                if post.save
                    flash[:notice] = "Post succesfully Published"
                    redirect_to review_path(id: discussion.review_id)
                else
                    flash[:alert] = post.errors.full_messages.inspect
                    redirect_to review_path(id: discussion.review_id)
                end
            }
        end
    end
end
