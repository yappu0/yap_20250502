class Admins::FoodsController < Admins::ApplicationsController
  before_action :set_food, only: %i[show edit update destroy]

  def index
    @foods = Food.default_order
  end

  def show
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to admins_food_url(@food), notice: t('controllers.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @food.update(food_params)
      redirect_to admins_food_url(@food), notice: t('controllers.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @food.destroy!
    redirect_to admins_foods_url, notice: t('controllers.destroyed')
  end

  private

  def food_params
    params.require(:food).permit(:name, :allergy, :freezed)
  end

  def set_food
    @food = Food.find(params[:id])
  end
end
