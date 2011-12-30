require 'spec_helper'

describe "LeadMails" do
  describe "POST /lead_mails/event" do
    it "accepts event callback" do
      new_lm = LeadMail.create( :email => "test@example.com" )
      new_lm.should_not be_nil
      post event_lead_mails_path( :lead_mail_id => new_lm.id, :event => "processed" )
      response.status.should be(200)
      new_lm.status.should == "Not known"
      new_lm.reload
      new_lm.status.should == "Processed"
    end
  end
end
