class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :title
      t.string :picture
      t.string :artist_name
      t.integer :artist_age
      t.string :artist_country
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
