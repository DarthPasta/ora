class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :title
      t.text :request_description
      t.string :request_category
      t.integer :token
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
