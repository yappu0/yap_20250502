class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: %i[show]

  def index
    @subscriptions = current_user.subscriptions.includes(:plan).default_order
  end

  def show
  end

  def new
    @subscription = current_user.subscriptions.build
  end

  def create
    @subscription = current_user.subscriptions.build(subscription_params)
    if @subscription.save_with_order
      redirect_to subscription_url(@subscription), notice: '定期購入の登録が完了しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:plan_id, :delivery_frequency, orders_attributes: [:delivery_time_zone])
  end

  def set_subscription
    @subscription = current_user.subscriptions.find(params[:id])
  end
end
