class InfosController < ApplicationController
  before_action :set_hive_information, only: [:show, :edit, :update, :destroy]
  #before_action :adminonly, only: [:show, :edit, :update, :destroy]
  # GET /hive_informations
  # GET /hive_informations.json

   
 helper_method :sort_column, :sort_direction
 def import
   Info.import(params[:file])
   redirect_to index_path, :notice => "Logged in!"
  end
 def testt
   @testt = Info.order(sort_column + " " + sort_direction).paginate(
       page: params[:page], per_page: 5)
   
 end
def active
  
 # @active_informations = Info.order(params[:sort] + " " + params[:direction])
  @active_information = Info.order(sort_column + " " + sort_direction).paginate(
      page: params[:page], per_page: 5)
      

end
  def inactive
    @inactive_information = Info.order(sort_column + " " + sort_direction).paginate(
      page: params[:page], per_page: 5)
    
  end
  def activated

    @active = Info.find(params[:id])

 if  @active.update_attribute(:is_active, false) 
      redirect_to request.referer.present? ? request.referer : default_path , notice: 'Info was successfully DEACTIVATED.'
    else
    end
   
   
  end
  def checkactivate

    
   @active = Info.where(id: params[:inactive_ids])

@active.update_all(["is_active =?", true]) 
      redirect_to request.referer.present? ? request.referer : default_path , notice: 'Info/s was successfully ACTIVATED.'

    
    

  end
  
  
  def checkinactive

    
   @active = Info.where(id: params[:active_ids])

@active.update_all(["is_active =?", false]) 
      redirect_to request.referer.present? ? request.referer : default_path , notice: 'Info/s was successfully DEACTIVATED.'

    
    

  end
  def index 
 
    
#@advance = params[:advancesearch1] 
 # @hive_informationsz = Info.atitle(@advance)
 
 atitle = params[:atitle]
 adescription = params[:adescription]
aresponsible = params[:aresponsible]
 asolution = params[:asolution]
 anote = params[:anote]
 
 @hive_informationsz = Info.advancesearchz(atitle, adescription, aresponsible, asolution, anote).order("created_at DESC").paginate(
      page: params[:page], per_page: 5)
 

 

         @searchh = params[:search]
  
    @hive_informations = Info.searchh(@searchh).order("created_at DESC").paginate(
      page: params[:page], per_page: 5)
    
  
    @categories = HiveCategory.uniq.pluck(:cat_id)
    
    
     end
     def create_comment
       @comment = Comment.new
         redirect_to :back
     end
  # GET /hive_informations/1
  # GET /hive_informations/1.json
  def show
    

    @comment = Comment.where(info_id: @hive_information).order("created_at DESC")
  end


  
  # GET /hive_informations/new
  def new
    @hive_information = Info.new
     @categories = HiveCategory.uniq.pluck(:cat_id)
  end

  # GET /hive_informations/1/edit
  def edit
   
    @hive_information = Info.find(params[:id])
  #  @hive_information = Info.all
     @categories = HiveCategory.uniq.pluck(:cat_id)
  end

  # POST /hive_informations
  # POST /hive_informations.json
  def create
    @hive_information = Info.new(information_params)

    respond_to do |format|
      if @hive_information.save
        format.html { redirect_to @hive_information, notice: 'Hive information was successfully created.' }
        format.json { render :show, status: :created, location: @hive_information }
      else
        format.html { render :new }
        format.json { render json: @hive_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hive_informations/1
  # PATCH/PUT /hive_informations/1.json
  def update
        @hive_information = Info.find(params[:id])
    respond_to do |format|
      if @hive_information.update(information_params)
        format.html { redirect_to @hive_information, notice: 'Hive information was successfully updated.' }
        format.json { render :show, status: :ok, location: @hive_information }
      else
        format.html { render :edit }
        format.json { render json: @hive_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hive_informations/1
  # DELETE /hive_informations/1.json
 
  def destroy
    @notactive = Info.find(params[:id])
    
     @notactive.update_attribute(:is_active, true) 
      redirect_to request.referer.present? ? request.referer : default_path , notice: 'Info was successfully ACTIVATED.'


   
     
   
  end

  private
  def sort_column
     Info.column_names.include?(params[:sort]) ? params[:sort] : "title"
   end
  
   def sort_direction
     %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
   end
    # Use callbacks to share common setup or constraints between actions.
    def set_hive_information
      
      @hive_information = Info.find(params[:id])
     
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def information_params
      params.require(:info).permit(:title, :description, :responsible, :note, :solution, :category_id, :is_active)
    end
end
