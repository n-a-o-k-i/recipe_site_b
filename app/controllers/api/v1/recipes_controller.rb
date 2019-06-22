module Api
  module V1
    class RecipesController < ApplicationController
      protect_from_forgery :except => [:create]
      def index
        recipes = Recipe.order(id: :asc)
        render json: { status: 'SUCCESS', message: 'loaded recipes', data: recipes }
      end

      def show
        ingredients = Ingredient.where(recipe_id: params[:id])
        instructions = Instruction.where(recipe_id: params[:id])
        render json: { status: 'SUCCESS', message: 'loaded the ingredients and instructions', data: [ingredients,instructions] }
        # render json: { status: 'SUCCESS', message: 'loaded the ingredients and instructions', data: [ingredients,instructions] }
      end

      def new
        @recipe = Recipe.new
        @recipe.ingredients.build
        @recipe.instructions.build
        respond_to do |format|
          format.any
          format.json { render json: @recipe }
        end
      end

      def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
          render json: [@recipe, @recipe.ingredients, @recipe.instructions], status: :created
        else
          render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private
        def set_recipe
          @recipe = recipe.find(params[:id])
        end
    
        def recipe_params
          params.fetch(:recipe, {}).permit(:title, :video_url, :thumbnail_url, :servings, :salt, :calorie, :introduction, :boosted, ingredients_attributes:[:recipe_id, :sort_order, :name, :quantity_and_unit, :_destroy], instructions_attributes:[:recipe_id, :sort_order, :body, :_destroy])
        end
    
        def render_status_404(exception)
          render json: { errors: [exception] }, status: 404
        end
    
        def render_status_500(exception)
          render json: { errors: [exception] }, status: 500
        end

    end
  end
end