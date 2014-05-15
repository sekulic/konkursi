class KorisniciController < ApplicationController
  respond_to :json
  
  def index
   if current_user.try(:admin?)    
    respond_with User.all
   else
     redirect_to root_path  
   end 
  end

  def show
    respond_with User.find(params[:id])
  end
  
  def create
    
  end

  def update
    
  end

  def destroy
    
  end
end
