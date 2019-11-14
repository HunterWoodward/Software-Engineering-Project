class WelcomeController < ApplicationController
    # before any blog action happens, it will authenticate the user
  before_action :authenticate_user!
  def index
    @email = current_user.email
    @first_name=current_user.first_name
    @last_name=current_user.last_name
    @avatar=current_user.avatar
    @bio=current_user.bio
    @role=current_user.role  
  end
  #Other Restful methods show, new, edit, create, update, destroy
end
