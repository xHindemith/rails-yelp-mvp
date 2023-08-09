class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :content

      t.timestamps
      t.references :restaurant, null: false, foreign_key: true
    end
  end
end
