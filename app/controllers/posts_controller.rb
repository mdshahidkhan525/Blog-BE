class PostsController < ApplicationController
  before_action :find_post, except: %i[index create]

  def index
    posts = Post.all
    render json: posts, status: 200
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: post, status: :created
    else
      render json: { errors: post.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @post
      @post.update(post_params)
      render json: @post
    else
      render json: { errors: 'Post not found' }, status: :unprocessable_entity
    end
  end

  def show
    if @post
      render json: @post, status: 200
    else
      render json: { errors: 'Post not found' }, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      render json: { post: @post, message: 'Post deleted successfully' }, status: 200
    else
      render json: { errors: 'Post not found' }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find_by_id(params[:id])
  end
end
