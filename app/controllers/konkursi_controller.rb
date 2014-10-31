class KonkursiController < ApplicationController
  include ApplicationHelper 
  include KonkursiHelper 
  before_action :check_isadmin?, only: [:new, :edit, :update, :destroy, :create, :edit]
  before_action :map_all, only: [:new, :create, :update, :edit]  
  before_action :set_konkurs, only: [:show, :edit, :update, :destroy]  

  def index
     @konkursi = Konkurs.all.paginate(:page => params[:page], :per_page => 12)
  end

  def search
    if params[:konkurs]
       if konkurs.has_key?(:vrsta_ids)
       @konkursi_vrsta = Konkurs.find_all_by_vrsta_id(konkurs[:vrsta_ids])
       else
       @konkursi_vrsta = Konkurs.all
       end 
       @konkursi = Array.new
       @konkursi = @konkursi_vrsta
#       @konkursi = filter_koknkursi(params[:konkurs], @konkursi)             
       if konkurs.has_key?(:status_ids)
        atribut = "status"
        @konkursi = konkursi_filter(konkurs[:status_ids], @konkursi, atribut)
       end
       if konkurs.has_key?(:raspisivac_ids)
        atribut = "raspisivac"       
        @konkursi = konkursi_filter(konkurs[:raspisivac_ids], @konkursi, atribut)
       end
       if konkurs.has_key?(:aplikant_ids)
        atribut = "aplikant" 
        @konkursi = konkursi_filter_apl(konkurs[:aplikant_ids], @konkursi, atribut)
       end
       if konkurs.has_key?(:sektor_ids)
        atribut = "sektor" 
        @konkursi = konkursi_filter_apl(konkurs[:sektor_ids], @konkursi, atribut)
       end  
    else   
      @konkursi = Konkurs.all
    end
       @konkursi = @konkursi.paginate(:page => params[:page], :per_page => 12)
       render action: 'index'
  end
  
  def show
    @kon_ap = AplikantKonkurs.find_all_by_konkurs_id(@konkurs[:id])
    @kon_se = SektoriKonkurs.find_all_by_konkurs_id(@konkurs[:id])
  end
  
  def new
    @konkurs = Konkurs.new   
  end
  
  def edit  
  end
  
  def create      
      @konkurs = Konkurs.new(konkurs_params)
      respond_to do |format|
        if @konkurs.save
          create_dependencies(konkurs_sektor_params[:sektor_ids], konkurs_aplikant_params[:aplikant_ids])            
          format.html { redirect_to @konkurs, notice: 'Konkurs je uspešno sačuvan.' }
          format.json { render action: 'show', status: :created, location: @konkurs }
        else
          format.html { render action: 'new' }
          format.json { render json: @konkurs.errors, status: :unprocessable_entity }
        end
      end
  end

  def update
      respond_to do |format|
         if @konkurs.update(konkurs_params)
            delete_dependencies(@konkurs[:id])
            create_dependencies(konkurs_sektor_params[:sektor_ids], konkurs_aplikant_params[:aplikant_ids])                         
            format.html { redirect_to @konkurs, notice: 'Konkurs je promenjen.' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit' }
            format.json { render json: @konkurs.errors, status: :unprocessable_entity }
          end
      end   
  end

  def destroy
      @konkurs.destroy
      delete_dependencies(@konkurs[:id])
      respond_to do |format|
        format.html { redirect_to konkursi_url }
        format.json { head :no_content }
      end
  end

  private  
    def set_konkurs
      @konkurs = Konkurs.find(params[:id])
    end  
    def konkurs_params
      params.require(:konkurs).permit(:ime, :iznos, :rok, :otvaranje, :opis, :valuta_id, :vrsta_id, :status_id, :raspisivac_id, :dokument)
    end
     def konkurs_sektor_params
      params.require(:konkurs).permit(:sektor_ids => [])
    end      
     def konkurs_aplikant_params
      params.require(:konkurs).permit(:aplikant_ids => [])
    end  
    def konkurs
      params.require(:konkurs).permit(:vrsta_ids => [],:status_ids => [],:raspisivac_ids => [],:aplikant_ids => [],:sektor_ids => []) if params[:konkurs]
    end        
end
