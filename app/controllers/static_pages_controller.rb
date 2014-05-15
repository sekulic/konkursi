class StaticPagesController < ApplicationController
  def home
    @konkursi_aktuelni = Konkurs.where(status_id: 1)
    @konkursi_najava = Konkurs.where(status_id: 2)
  end
  def send_mail
      email = params[:email]
      opis = params[:opis]
      KontaktMailer.contact_email(email, opis).deliver
      redirect_to kontakt_path, notice: 'Uspešno ste poslali poruku.'
  end  
  def pitanja
  
  end 
end
