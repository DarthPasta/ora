class CreateEngagements < ActiveRecord::Migration[5.1]
  def change
    create_table :engagements do |t|

      t.timestamps
    end
  end
end
