class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :pin
  has_many :votes, as: :voteable
  validates :content,presence:true
end
