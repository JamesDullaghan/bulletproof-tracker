class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    food.update_attributes(permitted_params)

    if food.save
      redirect_to food, notice: "You've added a new food!"
    else
      render action: 'new'
    end
  end

  def update
    food.update_attributes(permitted_params)

    if food.save
      redirect_to food, notice: "You've updated a food!"
    else
      render action: 'new'
    end
  end

  def destroy
    name = food.name.titleize
    food.destroy
    notice = "#{name} has been removed from foods list"
    redirect_to foods_url, notice: notice
  end

  private

  def permitted_params
    params.require(:food).permit(
      :name,
      :calories,
      :category,
      :cholesterol,
      :commitment,
      :fiber,
      :protein,
      :ratio_carb,
      :ratio_fat,
      :ratio_protein,
      :saturated_fat,
      :serving,
      :sodium,
      :sugar,
      :total_carbohydrate,
      :total_fat
    )
  end

  def foods
    Food.text_search(params.fetch(:query, '')).order(sort_column + " " + sort_direction).paginate(per_page: 10, page: params.fetch(:page, 1))
  end

  def food
    Food.find_or_initialize_by(id: params.fetch(:id, nil))
  end

  def sort_column
    Food.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  helper_method :sort_column, :sort_direction, :food
end
