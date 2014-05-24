class PitanjaController < ApplicationController
  def index
    if current_user.try(:admin?)
      @pitanja = Pit.all.paginate(:page => params[:page], :per_page => 13)
    else
      redirect_to root_path
    end
  end
  def show
    if current_user.try(:admin?) 
    @pitanje = Pit.find(params[:id])
    @komentar= Komentar.find_all_by_pit_id(params[:id])
    @komentari= @komentar.paginate(:page => params[:page], :per_page => 13)
    else
      redirect_to root_path
    end
  end   
  def destroy
      if current_user.try(:admin?) 
        @pitanje = Pit.find(params[:id])
        @pitanje.destroy
        @komentari= Komentar.find_all_by_pit_id(params[:id])
        @komentari.each do |komentar|
          komentar.destroy
        end
        respond_to do |format|
          format.html { redirect_to pitanja_index_path }
          format.json { head :no_content }
        end
      else
       redirect_to root_path  
      end 
  end 
end  