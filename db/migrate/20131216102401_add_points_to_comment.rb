class AddPointsToComment < ActiveRecord::Migration
  def change
    add_column :comments, :comment, :string
    add_column :comments, :points, :integer
  end
end
