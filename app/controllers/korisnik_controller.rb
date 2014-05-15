class KorisnikController < ApplicationController
  def index
    if current_user.try(:admin?)
      @korisnici = User.all.paginate(:page => params[:page], :per_page => 13)
    else
      redirect_to root_path
    end
  end
end