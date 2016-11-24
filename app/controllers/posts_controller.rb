class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all.order("created_at desc")
	end

	def new
		@post = Post.new 
	end

	def create
		@post = Post.new post_params

		if @post.save
			redirect_to @post, notice: "Uau Oscar, has guardat un post!"
		else
			render 'new', notice: "Oh no, no s'ha guardat el teu post!"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @post.update post_params
			redirect_to @post, notice: "Fuck yeah Oscar! El teu article s'ha guardat! xD"
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :content, :slug)
	end

	def find_post
		@post = Post.friendly.find(params[:id])
	end		

end
