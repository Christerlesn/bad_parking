class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :name
      t.string :url
      t.string :file
      t.string :caption
      t.integer :user_id
    end
  end
end

