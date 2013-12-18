class AddDefaultToPointsInPins < ActiveRecord::Migration
  def change
  	change_column :pins,:points,:integer,default:0
  end
end
