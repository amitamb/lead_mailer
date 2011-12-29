class AddStatusToLeadMail < ActiveRecord::Migration
  def change
    add_column :lead_mails, :status, :string
  end
end
