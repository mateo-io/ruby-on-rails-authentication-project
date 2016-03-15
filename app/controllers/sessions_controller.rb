class SessionsController < ApplicationController
	include SessionsHelper
	def new
	end

	def create
		user=User.find_by(email: params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			log_in(user)
			flash[:success]="Successful logged in"
			redirect_to posts_path
		else
			flash.now[:danger]="Log in failed"
			render 'new'
		end
	end

	def destroy
		user=current_user
	  	log_out(user) if logged_in?
	  	redirect_to root_url
	end
end
