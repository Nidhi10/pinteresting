class VotesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_pin,only: [:unvote_pin,:upvote_pin,:downvote_pin]
	before_action :set_vote_pin ,only: [:unvote_pin]
	before_action :set_comment,only: [:unvote_comment,:upvote_comment,:downvote_comment]
	before_action :set_vote_comment ,only: [:unvote_comment]

  def unvote_pin
  	@vote.destroy_all
  	redirect_to :back
  end

  def upvote_pin
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

  def downvote_pin
	  
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


def unvote_comment
  	@vote.destroy_all
  	redirect_to :back
  end

  def upvote_comment
	  @vote = @comment.votes.build(params[:vote])
	  @vote.user_id=current_user.id
	  @vote.vote=1
	  if @vote.save
	    flash[:notice] = "Successfully Voted."
	    redirect_to :back
	  else
	    redirect_to :back,notice:'failed to vote'
	  end
  end

  def downvote_comment
	  
	  @vote = @comment.votes.build(params[:vote])
	  @vote.user_id=current_user.id
	  @vote.vote=-1
	  if @vote.save
	    flash[:notice] = "Successfully Voted."
	    redirect_to :back
	  else
	    redirect_to :back,notice:'failed to vote'
	  end
  end

private
  def set_pin
  	@pin=Pin.find(params[:id])
	end 
  def set_vote_pin
  	@vote=@pin.votes.where(user_id:current_user.id)
  end 

  def set_comment
  	@comment=Comment.find(params[:id])
	end 
  def set_vote_comment
  	@vote=@comment.votes.where(user_id:current_user.id)
  end  
end
