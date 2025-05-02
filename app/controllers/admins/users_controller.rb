class Admins::UsersController < Admins::ApplicationsController
  before_action :set_user, only: %i[show]

  def index
    @users = User.default_order
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
