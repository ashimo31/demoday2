class AddKindToWork < ActiveRecord::Migration
  def change
    add_column :works, :kind, :string
  end
end
