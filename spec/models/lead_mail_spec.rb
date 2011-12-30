require 'spec_helper'

describe LeadMail do

  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
  end

  describe "" do
    it "should send an email when new lead_mail is created" do
      new_lm = LeadMail.create( :email => "test@example.com" )
      new_lm.should_not be_nil
      mail = ActionMailer::Base.deliveries.last
      mail['from'].to_s.should == 'amitamb@gmail.com'
      mail['to'].to_s.should == 'test@example.com <test@example.com>'
      mail['Subject'].to_s.should == 'Test lead mail'
      mail.body.to_s.should == "\nThis is a test mail sent to #{ new_lm.email }\n\nThis is a test link <a href=\"http://www.verticalset.com/\">VerticalSet</a>.\n"
    end
  end
end
