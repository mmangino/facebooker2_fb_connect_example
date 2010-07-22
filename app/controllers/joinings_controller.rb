class JoiningsController < ApplicationController
  before_filter :login_required
  def create
    if current_user and current_facebook_user
      current_user.update_attribute(:facebook_id,current_facebook_user.id)
      redirect_to notes_path
    else
      flash[:error] = "You must be logged in to facebook"
      redirect_to current_user
    end
  end
end
