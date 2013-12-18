class AddIndexOnUserAndVoteableTypeAndVoteableId < ActiveRecord::Migration
  def change
  	remove_index "votes", ["user_id", "voteable_id"]
  	add_index "votes", ["user_id", "voteable_id","voteable_type"],unique:true
  end
end
