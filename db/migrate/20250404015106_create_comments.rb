class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :blog, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
