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
      assert_equal 'amitamb@gmail.com', mail['from'].to_s
      assert_equal 'test@example.com <test@example.com>', mail['to'].to_s
      assert_equal 'Test lead mail', mail['Subject'].to_s
      assert_equal "\nThis is a test mail sent to #{ new_lm.email }\n\nThis is a test link <a href=\"http://www.verticalset.com/\">VerticalSet</a>.\n", mail.body.to_s
    end
  end
end
