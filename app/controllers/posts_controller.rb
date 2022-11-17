class PostsController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @posts = Post.all.page(params[:page]).per(10)
    @reservations = Reservation.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "ルームを登録しました"
      redirect_to("/posts/#{@post.id}")
    else
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @reservation = Reservation.new
    @user = current_user
  end

  def search
    @posts = Post.all.page(params[:page]).per(10)
  end

  private
   
    def post_params
      params.require(:post).permit(:name, :introduce, :price, :address, :image_name)
    end

    def set_q
      @q = Post.ransack(params[:q])
    end
  
  

end