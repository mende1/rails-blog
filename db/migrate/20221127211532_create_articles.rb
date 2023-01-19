class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.belongs_to :user, index: { unique: true }, foreign_key: true, null: false

      t.timestamps
    end
  end
end
