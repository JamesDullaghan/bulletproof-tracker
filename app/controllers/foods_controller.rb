class FoodsController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @foods = Food.text_search(params[:query]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
  end

  def show
    @food = Food.find(params[:id])
    respond_to do |format|
      format.html { render action: 'show' }
      format.js
    end
  end

  def new
    @food = Food.new
  end

  def edit
    @food = Food.find(params[:id])
  end

  def create
    @food = Food.find(params[:food])
    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: "You've added a new food!" }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    @food = Food.find(params[:id])
    respond_to do |format|
      if @food.update_attributes(params[:food])
        format.html { redirect_to @food, notice: "You've updated a food!" }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url }
    end
  end

  private

  def sort_column
    Food.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
