class ReservationsController < ApplicationController
  def new
    @users = current_user
    @post = Post.find(params[:post_id])
    @reservation = Reservation.new
  end

  def confirm
    @users = current_user
    @post = Post.find_by(id: params[:post_id])
    @reservation = Reservation.new(params.require(:reservation).permit(:id, :start_date, :end_date, :post_id, :person))
    @reservation.total_days = (@reservation.end_date - @reservation.start_date).to_i
    @reservation.total_price = (@reservation.total_days * @reservation.person * @post.price).to_i
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:post_id, :end_date, :start_date, :person, :total_days, :total_price))
    if @reservation.save
      flash[:notice] = "予約を完了しました"
      redirect_to :show
    else
      render :confirm
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  def index
    @reservations = Reservation.all
    @posts = Post.all
  end

end
