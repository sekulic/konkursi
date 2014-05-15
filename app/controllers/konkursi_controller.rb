class KonkursiController < ApplicationController
 include ApplicationHelper 
  before_action :check_isadmin?, only: [:new, :edit, :update, :destroy]
  # GET /konkursi
  # GET /konkursi.json

  def index
    if current_user.try(:admin?)
     @konkursi = Konkurs.all
    else
     redirect_to root_path  
    end 
  end

  # GET /konkursi/1
  # GET /konkursi/1.json
  def show
    @konkurs = Konkurs.find(params[:id])
    @kon_ap = AplikantKonkurs.find_all_by_konkurs_id(@konkurs[:id])
    @kon_se = SektoriKonkurs.find_all_by_konkurs_id(@konkurs[:id])
  end

  # GET /konkursi/new
  def new
    if current_user.try(:admin?)
    @raspisivac = Raspisivac.all.map{|u| [ u.name, u.id ] }
    @vrsta = Vrste.all.map{|u| [ u.name, u.id ] }
    @valuta = Valuta.all.map{|u| [ u.name, u.id ] }
    @status = Status.all.map{|u| [ u.name, u.id ] }    
    @konkurs = Konkurs.new
    else
     redirect_to root_path  
    end    
  end

  # GET /konkursi/1/edit
  def edit
    if current_user.try(:admin?)    
    @konkurs = Konkurs.find(params[:id])
    @raspisivac = Raspisivac.all.map{|u| [ u.name, u.id ] }    
    @valuta = Valuta.all.map{|u| [ u.name, u.id ] }
    @vrsta = Vrste.all.map{|u| [ u.name, u.id ] }
    @status = Status.all.map{|u| [ u.name, u.id ] } 
    else
     redirect_to root_path  
    end       
  end

  # POST /konkursi
  # POST /konkursi.json
  def create
    if current_user.try(:admin?)     
      @raspisivac = Raspisivac.all.map{|u| [ u.name, u.id ] }
      @vrsta = Vrste.all.map{|u| [ u.name, u.id ] }
      @valuta = Valuta.all.map{|u| [ u.name, u.id ] }
      @status = Status.all.map{|u| [ u.name, u.id ] }      
      @konkurs = Konkurs.new(konkurs_params)
      respond_to do |format|
        if @konkurs.save
          konkurs_sektor_params[:sektor_ids].each do |sektor_id|
          @upis = SektoriKonkurs.new(:sektori_id => sektor_id.to_i, :konkurs_id => @konkurs[:id])
          @upis.save 
          end  
          konkurs_aplikant_params[:aplikant_ids].each do |aplikant_id|
          @upis2 = AplikantKonkurs.new(:aplikant_id => aplikant_id.to_i, :konkurs_id => @konkurs[:id])
          @upis2.save 
          end              
          format.html { redirect_to @konkurs, notice: 'Konkurs je uspešno sačuvan.' }
          format.json { render action: 'show', status: :created, location: @konkurs }
        else
          format.html { render action: 'new' }
          format.json { render json: @konkurs.errors, status: :unprocessable_entity }
        end
      end
    else
     redirect_to root_path  
    end 
  end

  # PATCH/PUT /konkursi/1
  # PATCH/PUT /konkursi/1.json
  def update
    if current_user.try(:admin?) 
      @raspisivac = Raspisivac.all.map{|u| [ u.name, u.id ] }
      @vrsta = Vrste.all.map{|u| [ u.name, u.id ] }
      @valuta = Valuta.all.map{|u| [ u.name, u.id ] }
      @status = Status.all.map{|u| [ u.name, u.id ] }
      respond_to do |format|
          @konkurs = Konkurs.find params[:id]
       if @konkurs.update(konkurs_params)
          @izbris = SektoriKonkurs.find_all_by_konkurs_id(@konkurs[:id])
          @izbris.each do |izbris|
            izbris.destroy
          end
          konkurs_sektor_params[:sektor_ids].each do |sektor_id|
          @upis = SektoriKonkurs.new(:sektori_id => sektor_id.to_i, :konkurs_id => @konkurs[:id])
          @upis.save 
          end 
          @izbris2 = AplikantKonkurs.find_all_by_konkurs_id(@konkurs[:id])
          @izbris2.each do |izbris2|
            izbris2.destroy
          end
          konkurs_aplikant_params[:aplikant_ids].each do |aplikant_id|
          @upis2 = AplikantKonkurs.new(:aplikant_id => aplikant_id.to_i, :konkurs_id => @konkurs[:id])
          @upis2.save 
          end                    
          format.html { redirect_to @konkurs, notice: 'Konkurs was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @konkurs.errors, status: :unprocessable_entity }
        end
      end
    else
     redirect_to root_path  
    end     
  end

  # DELETE /konkursi/1
  # DELETE /konkursi/1.json
  def destroy
    if current_user.try(:admin?) 
      @konkurs = Konkurs.find(params[:id])
      @konkurs.destroy
      @izbris = SektoriKonkurs.find_all_by_konkurs_id(@konkurs[:id])
      @izbris.each do |izbris|
      izbris.destroy
      end
      respond_to do |format|
        format.html { redirect_to konkursi_url }
        format.json { head :no_content }
      end
    else
     redirect_to root_path  
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.



    # Never trust parameters from the scary internet, only allow the white list through.
    
    def konkurs_params
      params.require(:konkurs).permit(:ime, :iznos, :rok, :otvaranje, :opis, :valuta_id, :vrsta_id, :status_id, :raspisivac_id, :dokument)
    end
     def konkurs_sektor_params
      params.require(:konkurs).permit(:sektor_ids => [])
    end      
     def konkurs_aplikant_params
      params.require(:konkurs).permit(:aplikant_ids => [])
    end     
end
