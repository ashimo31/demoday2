class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
        t.integer :user_id
        t.boolean :askbid, default: false
        t.string :title
        t.text :content
        t.text :area
        t.datetime :deadline
        t.integer :status, default: 0
        t.integer :price
        t.text :reaction
      t.timestamps null: false
    end
  end
end
