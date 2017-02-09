class CocktailsController < ApplicationController

  before_action :set_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktails = Cocktail.all
  end

  private
    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    def restaurant_params
      params.require(:cocktail).permit(:name)
    end

end
