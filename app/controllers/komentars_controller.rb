class KomentarsController < ApplicationController
  respond_to :json
  
  # GET /raspisivacs
  # GET /raspisivacs.json
  def index
    respond_with Komentar.all
  end

  def show
    respond_with Komentar.find(params[:id])
  end
  
  def create
    respond_with Komentar.create(komentar_params.merge(:user_id => current_user.id))
  end

  def update
    respond_with Komentar.update(params[:id], komentar_params)
  end

  def destroy
    respond_with Komentar.destroy(params[:id])
  end

  private

    def komentar_params
      params.require(:komentar).permit(:name, :pit_id)
    end
end
