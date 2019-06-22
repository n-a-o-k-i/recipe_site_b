module Api
  module V1
    class IngredientsController < ApplicationController
      protect_from_forgery :except => [:create]
      def index
        ingredients = Ingredients.order(id: :asc)
        render json: { status: 'SUCCESS', message: 'loaded ingredients', data: ingredients }
      end

      def show
        ingredients = Ingredient.where(ingredients_id: params[:id])
        instructions = Instruction.where(ingredients_id: params[:id])
        render json: { status: 'SUCCESS', message: 'loaded the ingredients and instructions', data: ingredients }
        # render json: { status: 'SUCCESS', message: 'loaded the ingredients and instructions', data: [ingredients,instructions] }
      end

      def create
        ingredients = Ingredients.new(ingredients_params)
        if ingredients.save
          render json: ingredients, status: :created
        else
          render json: { errors: ingredients.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private
        def set_ingredients
          @ingredients = ingredients.find(params[:id])
        end
    
        def ingredients_params
          params.fetch(:ingredients, {}).permit(:recipe_id, :sort_order, :name, :quantity_and_unit)
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