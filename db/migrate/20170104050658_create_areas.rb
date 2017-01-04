class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.text :name, null: false

      t.timestamps null: false
    end
  end
end
