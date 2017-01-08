class RemovePrefectureFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :prefecture, :integer
  end
end
