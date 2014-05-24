class PitsController < ApplicationController
  respond_to :json
  
  # GET /raspisivacs
  # GET /raspisivacs.json
  def index
    respond_with Pit.all
  end

  def show
    respond_with Pit.find(params[:id])
  end
  
  def create
    respond_with Pit.create(pits_params.merge(:user_id => current_user.id))
  end

  def update
    respond_with Pit.update(params[:id], pits_params)
  end

  def destroy

  end

  private

    def pits_params
      params.require(:pit).permit(:name)
    end
end
