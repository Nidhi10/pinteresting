class Pin < ActiveRecord::Base
	belongs_to :user
	has_many :comments, as: :commentable,dependent: :destroy
	has_many :votes, as: :voteable
	 has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" },
	  :default_url => "/images/:style/missing.png"
	  
	  validates :image, presence: true
  	  validates :description, presence: true
end
