class Admins::Users::SubscriptionsController < Admins::ApplicationsController
  before_action :set_user
  before_action :set_subscription

  def show
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_subscription
    @subscription = @user.subscriptions.find(params[:id])
  end
end
