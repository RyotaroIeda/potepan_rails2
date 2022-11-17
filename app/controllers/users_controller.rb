class UsersController < ApplicationController


  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(params.require(:user).permit(:image_name, :name, :text))
      flash[:notice] = "プロフィールを更新しました"
      redirect_to :user
    else
      render :edit
    end
  end

end