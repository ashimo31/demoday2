class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.text :prefecture, null: false

      t.timestamps null: false
    end
  end
end
