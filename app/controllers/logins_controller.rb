class LoginsController < ApplicationController

	def new

	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:success]="You are looged in"
			redirect_to contents_path

		else
			flash.now[:danger]="Your emaail or password does not match"
			render "new"
		end

	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You are logged out"
		redirect_to root_path
	end



end