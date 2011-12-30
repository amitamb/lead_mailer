class LeadSender < ActionMailer::Base
  default from: "amitamb@gmail.com"
  
  def lead_mail(lead_mail)
    @lead_mail = lead_mail
    puts "returning message to deliver"
    mail(:to => "#{lead_mail.email} <#{lead_mail.email}>", :subject => "Test lead mail", :"X-SMTPAPI" => { :"unique_args" => { :"lead_mail_id" => lead_mail.id } }.to_json.to_s )
  end
end
