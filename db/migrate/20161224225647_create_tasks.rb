class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

          t.string :title
          t.text :content
          t.text :area
          t.datetime :deadline
          t.integer :price
          t.integer :status, default: 0

      t.timestamps null: false
  end
 end
end
