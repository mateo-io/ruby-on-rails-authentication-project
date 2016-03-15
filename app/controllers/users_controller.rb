class UsersController < ApplicationController
	include UsersHelper
	
	before_action  :create_token, only: [:create]

	def show
		@user=User.find(params[:id])
	end

	def new
		@user=User.new
	end


	def create
		@user=User.new(user_params)
		if @user.save
			session[:user_id]=@user.id
			flash[:sucess]="Yeah you did brah"
			redirect_to root_path
		else
			flash.now[:danger]="Try again"
			render 'new'
		end
	end


	def destroy
		@user=User.find(params[:id])
		@user.destroy
	end

end
