class CreateHerbs < ActiveRecord::Migration[5.2]
  def change
    create_table :herbs do |t|
      t.string :name
      t.text :description
      t.text :usage
      t.string :image_link
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
