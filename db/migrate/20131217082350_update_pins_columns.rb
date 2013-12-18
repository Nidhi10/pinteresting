class UpdatePinsColumns < ActiveRecord::Migration
  def change
  	remove_column :pins,:points,:integer
  	remove_column :pins,:pins
  	add_column :pins,:points,:integer,default:0
  end
end
