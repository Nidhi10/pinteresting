class VotesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_pin,only: [:unvote,:upvote,:downvote]
	before_action :set_vote ,except: [:upvote,:downvote]

  def unvote
  	@vote.destroy_all
  	redirect_to :back


  end

  def upvote
	  @vote = @pin.votes.build(params[:vote])
	  @vote.user_id=current_user.id
	  @vote.vote=1
	  if @vote.save
	    flash[:notice] = "Successfully Voted."
	    redirect_to :back
	  else
	    redirect_to :back,notice:'failed to vote'
	  end
  end

  def downvote
	  
	  @vote = @pin.votes.build(params[:vote])
	  @vote.user_id=current_user.id
	  @vote.vote=-1
	  if @vote.save
	    flash[:notice] = "Successfully Voted."
	    redirect_to :back
	  else
	    redirect_to :back,notice:'failed to vote'
	  end
  end

  def set_pin
  	@pin=Pin.find(params[:id])
	end 
  def set_vote
  	@vote=@pin.votes.where(user_id:current_user.id)
  end 
  
end
