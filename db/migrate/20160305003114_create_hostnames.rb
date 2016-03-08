class CreateHostnames < ActiveRecord::Migration[5.0]
  def change
    create_table :hostnames do |t|
      t.string :hostname, null: false, default: ""
      t.string :description, null: false, default: ""

      t.timestamps null: false
    end
  end
end
