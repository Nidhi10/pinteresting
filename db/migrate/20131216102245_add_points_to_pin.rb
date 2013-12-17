class AddPointsToPin < ActiveRecord::Migration
  def change
    add_column :pins, :pin, :string
    add_column :pins, :points, :integer
  end
end
