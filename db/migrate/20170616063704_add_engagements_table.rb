class AddEngagementsTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :engagements do |t|
      t.text :engagement_description
      t.references :user, foreign_key: true
      t.references :request, foreign_key: true
      t.references :offer, foreign_key: true

      t.timestamps
  end
end
