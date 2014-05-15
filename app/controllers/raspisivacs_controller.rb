class RaspisivacsController < ApplicationController
  before_action :set_raspisivac, only: [:show, :edit, :update, :destroy]

  # GET /raspisivacs
  # GET /raspisivacs.json
  def index
    if current_user.try(:admin?) 
    @raspisivacs = Raspisivac.all
    else
     redirect_to root_path  
    end
  end

  # GET /raspisivacs/1
  # GET /raspisivacs/1.json
  def show
    if current_user.try(:admin?) 
      
    else
     redirect_to root_path  
    end    
  end

  # GET /raspisivacs/new
  def new    
    if current_user.try(:admin?) 
    @raspisivac = Raspisivac.new
    else
     redirect_to root_path  
    end  
  end

  # GET /raspisivacs/1/edit
  def edit
    if current_user.try(:admin?) 
 
    else
     redirect_to root_path  
    end
  end

  # POST /raspisivacs
  # POST /raspisivacs.json
  def create
    if current_user.try(:admin?) 
      @raspisivac = Raspisivac.new(raspisivac_params)
      respond_to do |format|
        if @raspisivac.save
          format.html { redirect_to @raspisivac, notice: 'Raspisivac was successfully created.' }
          format.json { render action: 'show', status: :created, location: @raspisivac }
        else
          format.html { render action: 'new' }
          format.json { render json: @raspisivac.errors, status: :unprocessable_entity }
        end
      end
    else
     redirect_to root_path  
    end
  end

  # PATCH/PUT /raspisivacs/1
  # PATCH/PUT /raspisivacs/1.json
  def update
    if current_user.try(:admin?)    
      respond_to do |format|
        if @raspisivac.update(raspisivac_params)
          format.html { redirect_to @raspisivac, notice: 'Raspisivac was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @raspisivac.errors, status: :unprocessable_entity }
        end
      end
    else
     redirect_to root_path  
    end 
  end

  # DELETE /raspisivacs/1
  # DELETE /raspisivacs/1.json
  def destroy
    if current_user.try(:admin?)    
      @raspisivac.avatar = nil
      @raspisivac.save
      @raspisivac.destroy
      respond_to do |format|
        format.html { redirect_to raspisivacs_url }
        format.json { head :no_content }
      end
    else
     redirect_to root_path  
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raspisivac
      @raspisivac = Raspisivac.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raspisivac_params
      params.require(:raspisivac).permit(:name, :avatar)
    end
end
