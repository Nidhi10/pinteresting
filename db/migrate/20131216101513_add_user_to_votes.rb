class AddUserToVotes < ActiveRecord::Migration
  def change
    add_reference :votes, :user, index: true
    add_reference :votes, :pin, index: true
    add_column :votes, :voteable_id, :integer
    add_column :votes, :voteable_type, :string
    add_column :votes, :vote, :integer,default:0
    add_index :votes,[:user_id,:pin_id],unique:true
  end
end
