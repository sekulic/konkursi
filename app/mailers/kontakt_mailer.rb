class KontaktMailer < ActionMailer::Base
  default from: 'projekti.in.rs@gmail.com'
    def contact_email(email, opis)
    rade ="sekulic.radosav@yahoo.com"
    mail(to: rade,
         body: opis,
         content_type: "text/html",
         subject: "Poruka od: #{email}")
    end
end