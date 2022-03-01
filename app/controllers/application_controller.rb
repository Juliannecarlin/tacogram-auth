class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    # puts "------------------ code before every request ------------------"
    # TODO: @current_user = ...
    @current_user = User.find(session[:user_id]) if session[:uder_id]
  end
end
