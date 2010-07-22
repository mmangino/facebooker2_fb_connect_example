class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by_email(params[:email])
    create_via_facebook_connect if @user.nil?
    if @user
      session[:user_id] = @user.id
    end
    if current_user
      redirect_to session[:return_to]||notes_path
      session[:return_to]=nil
    else
      flash[:error] = "Unable to log you in"
      render :action=>"new"
    end
  end
  
  def destroy
    session[:user_id]=nil
    redirect_to root_path
  end
  
  def create_via_facebook_connect
    if current_facebook_user
      #look for an existing user
      @user = User.find_by_facebook_id(current_facebook_user.id)
      if @user.nil?
        #if one isn't found, try to grab the email address and join to an existing account
        current_facebook_user.fetch
        unless current_facebook_user.email.blank?
          @user = User.find_by_email(current_facebook_user.email) 
          @user.update_attribute(:facebook_id,current_facebook_user.id) if @user
        end
      end
    end
  end
    
end
