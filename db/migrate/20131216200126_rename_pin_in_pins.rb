class RenamePinInPins < ActiveRecord::Migration
  def change
  	change_column :pins,:pin,:integer,:default=>0
  end
end
