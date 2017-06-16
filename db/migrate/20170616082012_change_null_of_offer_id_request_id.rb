class ChangeNullOfOfferIdRequestId < ActiveRecord::Migration[5.1]
  def change
  	change_column :engagements, :offer_id, :integer, :null => true
  	change_column :engagements, :request_id, :integer, :null => true
  end
end
