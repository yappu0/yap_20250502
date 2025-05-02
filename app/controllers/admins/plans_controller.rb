class Admins::PlansController < Admins::ApplicationsController
  before_action :set_plan, only: %i[show edit update destroy]

  def index
    @plans = Plan.default_order
  end

  def show
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to admins_plan_url(@plan), notice: t('controllers.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @plan.update(plan_params)
      redirect_to admins_plan_url(@plan), notice: t('controllers.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @plan.destroy!
    redirect_to admins_plans_url, notice: t('controllers.destroyed')
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :description, :price, plan_foods_attributes: %i[id food_id amount _destroy])
  end

  def set_plan
    @plan = Plan.find(params[:id])
  end
end
