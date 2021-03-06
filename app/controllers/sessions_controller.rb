class SessionsController < ApplicationController
  
  def new
  end

  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to '/home'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url
    #session[:user_id] = nil
    #redirect_to root_url, :notice => "Logged Out"
  end

end
