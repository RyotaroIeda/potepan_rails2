class ReservationsController < ApplicationController
  def new
    @users = current_user
    @post = Post.find_by(id: params[:post_id])
    @reservation = Reservation.new
  end

  def confirm
    @users = current_user
    @post = Post.find_by(id: params[:post_id])
    @reservation = Reservation.new(params.permit(:id, :start_date, :end_date, :person, :post_id, :user_id))
    if (@reservation.start_date < Date.today) || (@reservation.end_date < Date.today)
      flash[:notice] = "今日以降の日付をチェックしてください"
      render :new
    end
    @reservation.total_days = (@reservation.end_date - @reservation.start_date).to_i
    if @reservation.total_days <= 0
      flash[:notice] = "チェックインはチェックアウトより前にしてください"
      render :new
    end
    @reservation.total_price = (@reservation.total_days * @reservation.person * @post.price).to_i
  end

  def create
    @user = current_user
    @post = Post.find_by(id: params[:post_id])
    @reservation = Reservation.new(params.permit(:start_date, :end_date, :person, :total_days, :total_price, :post_id, :user_id))
    @reservation.user_id = @user.id
    @reservation.name = @post.name
    @reservation.image_name = @post.image_name
    @reservation.introduce = @post.introduce
    if @reservation.save!
      flash[:notice] = "予約を完了しました"
      redirect_to "/posts/#{@reservation.post_id}/reservations/#{@reservation.id}"
    else
      render :confirm
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @post = Post.find_by(id: params[:post_id])
  end

  def index
    @reservations = Reservation.all
    @posts = Post.all
    
  end


end
