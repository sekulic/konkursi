class KorisniciController < ApplicationController
  respond_to :json
  
  def index    
    respond_with User.all 
  end

  def show

  end
  
  def create
    
  end

  def update
    
  end

  def destroy
    if current_user.try(:admin?) 
      @korisnik = User.find(params[:id])
      @korisnik.destroy
      respond_to do |format|
        format.html { redirect_to all_users_path }
        format.json { head :no_content }
      end
    else
     redirect_to root_path  
    end 
  end
end
