class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:new, :create, :index]
  # GET /userlogins
  # GET /userlogins.json

  def index
    @people = Person.all
  end

  # GET /userlogins/1
  # GET /userlogins/1.json
  def show
  end

  # GET /userlogins/new
  def new
    @person = Person.new
  end

  # GET /userlogins/1/edit
  def edit
  end

  # POST /userlogins
  # POST /userlogins.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to people_url, notice: 'Userlogin was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userlogins/1
  # PATCH/PUT /userlogins/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to people_url, notice: 'Userlogin was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userlogins/1
  # DELETE /userlogins/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Userlogin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:person, :password,:is_admin)
    end
end
