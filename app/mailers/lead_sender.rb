class LeadSender < ActionMailer::Base
  default from: "amitamb@gmail.com"
  
  def lead_mail(lead_mail)
    @lead_mail = lead_mail
    mail(:to => "#{lead_mail.email} <#{lead_mail.email}>", :subject => "Test lead mail")
  end
end
