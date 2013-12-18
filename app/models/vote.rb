class Vote < ActiveRecord::Base
	belongs_to :voteable, polymorphic:true

	after_save :vote_points
	before_destroy :unvote_points

	def vote_points
		if self.voteable_type=="Pin"
			@voteable=Pin.find(self.voteable_id)
		elsif self.voteable_type="Comment"
			@voteable=Comment.find(self.voteable_id)
		end
		if self.vote==1
			@voteable.increment! :points, 1
		elsif self.vote==-1
			@voteable.decrement! :points,1
		end
	end

	def unvote_points
		if self.voteable_type=="Pin"
			@voteable=Pin.find(self.voteable_id)
		elsif self.voteable_type=="Comment"
			@voteable=Comment.find(self.voteable_id)
		end
		if self.vote==1
			@voteable.decrement! :points,1
		elsif self.vote==-1
			@voteable.increment! :points,1
		end
	end

end
