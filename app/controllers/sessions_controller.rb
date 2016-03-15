class SessionsController < ApplicationController
	include SessionsHelper
	def new
		@session=Session.new
	end

	def create
		user=User.find_by(email: params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			session[:user_id]=user.id
			flash[:success]="Successful logged in"
			redirect_to posts_path
		else
			flash.now[:danger]="Log in failed"
			render 'new'
		end
	end

	def destroy
		session[:user_id]=nil
		redirect_to root_url
	end
end
