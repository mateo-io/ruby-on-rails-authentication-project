class PostsController < ApplicationController
	include PostsHelper

	def index
		@posts=Post.all
	end

	def show
		@post=Post.find(params[:id])
	end

	def new
		@post=Post.new
	end

	def create
		@post=Post.new(post_params)
		if logged_in?
			@post[:user_id]=session[:user_id]
			if @post.save
				flash[:success]="Your post has been published, rawrr"
				redirect_to posts_path
			else
				flash.now[:danger]="There was an error"
				render 'new'
			end
		else
			flash[:danger]="You must log in to post gossip bro"
			redirect_to login_path
		end
	end

end
