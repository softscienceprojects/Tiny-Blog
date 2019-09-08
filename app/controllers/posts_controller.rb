class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    before_action :require_login
    skip_before_action :require_login, only: [:index, :show]

    def index
        @posts = Post.all
    end

    def show
        
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        if @post.save
            flash[:notice] = "Post was successfully created"
            redirect_to post_path(@post)
        else
            redirect_to new
        end
    end

    def edit

    end

    def update
        @post.update(post_params)
        redirect_to post_path(@post)
    end

    def destroy

    end

    private

    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :user_id)
    end

    def require_login
        redirect_to new_session_path unless session.include? :user_id
    end
end
