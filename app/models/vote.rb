class Vote < ActiveRecord::Base
	belongs_to :voteable, polymorphic:true

	after_save :vote_points
	before_destroy :unvote_points

	def vote_points
		@pin=Pin.find(self.voteable_id)

		if self.vote==1
			@pin.increment! :points, 1
		elsif self.vote==-1
			@pin.decrement! :points,1
		end
	end

	def unvote_points
		@pin=Pin.find(self.voteable_id)
		if self.vote==1
			@pin.decrement! :points,1
		elsif self.vote==-1
			@pin.increment! :points,1
		end
	end

end
