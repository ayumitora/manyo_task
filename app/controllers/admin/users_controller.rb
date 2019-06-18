class Admin::UsersController < ApplicationController
  # before_action :require_admin, onry: [:index, :destroy]
  skip_before_action :login_required
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.admin?
      @users = User.all
    else
      redirect_to root_path
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id unless current_user.admin?
      redirect_to admin_user_path(@user), notice: "ユーザー「#{@user.user_name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path(@user), notice: "ユーザー「#{@user.user_name}」を更新しました。"
    else
      render :new
    end
  end

  def destroy
    if current_user.admin?
      @user.destroy
      redirect_to admin_users_url, notice: "ユーザー「#{@user.user_name}」を削除しました。"
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :user_name, :email, :password, :password_confirmation, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

  # def require_admin
  #   redirect_to root_path unless current_user.admin?
  # end
end