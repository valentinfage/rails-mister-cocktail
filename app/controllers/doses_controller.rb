class DosesController < ApplicationController

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    # dans les params de l'url j'aurais l'id du cocktail
    # on fait un find sur l'id, on trouve le cocktail
    @dose = Dose.new(dose_params)
    # j'instancie ma dose en prenant les parametres (description et ingredients)
    @dose.cocktail = @cocktail
    # j'affect mon instance de dose à mon instance de cocktail
    @dose.save
    # je sauvergarde dans la DB
    redirect_to cocktail_path(@cocktail)
    # je redirect sur la vue show sur laquelle j'etais
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
