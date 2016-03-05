class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :url, null: false
      t.string :title
      t.integer :hostname_id

      t.timestamps null: false
    end
  end
end
