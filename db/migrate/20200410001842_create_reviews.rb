class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :author_name
      t.text :body
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
