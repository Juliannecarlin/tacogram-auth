class SessionsController < ApplicationController
  def new
  end
  
  def create
    # TODO: authenticate user
    @user = User.find_by({ email: params["email"] })
    if @user  
      if BCrypt::Password.new(@user.password) == params["password"]
        session[:used_id] = @user.id 
        flash[:notice] = "Welcome, #{@user.first_name}."
        redirect_to "/posts"
      else
        flash[:notice] = "Nope"
        redirect_to "/sessions/new"
      end
    else  
      flash[:notice] = "Nope"
      redirect_to "/sessions/new"
    end
   end
  end
end
