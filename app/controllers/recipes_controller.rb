class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
    @recipe.products.build
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if(@recipe.save)
      redirect_to @recipe, notice: "Recipe created"
    else
      render 'new'
    end
  end

  def edit
    @recipe.products.build

  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe updated"
    else
      render 'edit'
    end

  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path

  end

  def save_direction
    recipe = Recipe.find(params[:recipe_id])
    direction = recipe.directions.build(:step => params[:step])

     if recipe.save
      #refresh page
      redirect_to edit_recipe_path(recipe.id)
     else
       puts "#{params[:step]}"
    end
  end

  def remove_direction
    puts "what"
    recipe = Recipe.find(params[:recipe_id])
    direction = Direction.find(params[:direction_id])
    recipe.directions.delete(direction)
    redirect_to edit_recipe_path(recipe.id)
    # The collection.delete method removes one or more objects from the collection by setting their foreign keys to NULL

    #@author.books.delete(@book1)

    # Additionally, objects will be destroyed if they're associated with dependent: :destroy, and deleted if they're associated with dependent: :delete_all.

  end




  private 

  def recipe_params
    params.require(:recipe).permit(:title, :description, :recipeimg,
      ingredients_attributes: [:id, :name, :_destroy],
        directions_attributes: [:id, :step, :_destroy],
        product_ids: [],
        anyingredients_attributes: [:id, :name, :_destroy])
  end

 
  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
