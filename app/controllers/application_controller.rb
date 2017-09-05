class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  	helper_method :current_user, :logged_in?

  	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end

  	def logged_in?
  		!!current_user
  	end

  	def require_user
  		if !logged_in?
  			flash[:danger]="you must be logged in to perform that action"
  			redirect_back fallback_location: contents_path(@content)
  		end
  	end

end