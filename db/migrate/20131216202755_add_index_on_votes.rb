class AddIndexOnVotes < ActiveRecord::Migration
  def change
  	remove_index "votes", ["user_id", "pin_id"]
  	add_index "votes", ["user_id", "voteable_id"],unique:true
  end
end
