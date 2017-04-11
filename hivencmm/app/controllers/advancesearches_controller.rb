class AdvancesearchesController < ApplicationController
  
  def new
    @advancesearch = Advancesearch.new
    @categories = HiveInformation.uniq.pluck(:category_id)
  end
  
  
  def create
    
    @advancesearch = Advancesearch.create(search_params)
    redirect_to @advancesearch
  end
  
  
  def show
    @advancesearch = Advancesearch.find(params[:id])
  end
  
  
  private
  
  def search_params
    
    params.require(:advancesearch).permit(:title, :description, :responsible, :note, :solution, :category_id, :is_active)
    
  end
  
  
  
end
