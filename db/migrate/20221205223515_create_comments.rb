class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.belongs_to :article, index: { unique: true }, foreign_key: true, null: false

      t.timestamps
    end
  end
end
