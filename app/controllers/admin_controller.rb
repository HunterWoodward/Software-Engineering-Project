class AdminController < ApplicationController
    def show_users
        users = User.all.where.not(id: current_user.id)
        respond_to do |format|
            format.html{render :show, locals:{users: users}
            }
        end
    end

    def edit_role
        user = User.find(params[:id])
        respond_to do |format|
            format.html{render :edit, locals:{user: user}}
        end
    end

    def change_role
        user = User.find(params[:id])
        respond_to do |format|
            format.html{
                if user.update_without_password(params.permit(:role))
                    flash[:notice] = "Role Changed!"
                    redirect_to admin_path
                else
                    flash[:alert] = user.error.full_messages
                    render :edit, locals:{user: user}
                end
            }
        end
    end

end