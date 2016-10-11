class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.includes(:user).all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user

		if @post.save
			redirect_to @post, notice: "Post was created successfully"
		else
			render :new
		end
	end	

	def show
	end

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:notice] = 'Post was successfully updated.'
			redirect_to @post
		else
			render action: 'edit'
		end
	end

	def destroy
		@post.destroy
		flash[:notice] = "Post was successfully deleted."
		redirect_to posts_path
	end

	private
	def post_params
		params.require(:post).permit(:date, :rationale)
	end

	def set_post
		@post = Post.find(params[:id])
	end
end
