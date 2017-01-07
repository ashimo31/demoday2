class AddPrefectureToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :prefecture, :integer
  end
end
