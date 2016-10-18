class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.posts_by(current_user)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user

		if @post.save
			redirect_to @post, success: "Post was created successfully"
		else
			render :new
		end
	end	

	def show
	end

	def edit
		authorize @post

	# USE THE FOLLOWING FOR CUSTOM FLASH MESSAGES	
	#		rescue Pundit::NotAuthorizedError
	#			if not current_user == @post.user
	#				flash[:warning] = "You are not authorized to perform this action."
	#			elsif @post.approved?
	#				flash[:warning] = "The Record is already approved"
	#			end
	#			redirect_to root_path
	end

	def update
		authorize @post
		if @post.update(post_params)
			flash[:success] = 'Post was successfully updated.'
			redirect_to @post
		else
			render action: 'edit'
		end
	end

	def destroy
		@post.destroy
		flash[:success] = "Post was successfully deleted."
		redirect_to posts_path
	end

	private
	def post_params
		params.require(:post).permit(:date, :rationale, :status)
	end

	def set_post
		@post = Post.find(params[:id])
	end
end
