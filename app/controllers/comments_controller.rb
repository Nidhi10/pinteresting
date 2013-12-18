class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_pin , except: [:destroy]
  before_action :set_pin_destroy , only: [:destroy]
	before_action :set_comment ,only: [:destroy]

  def create
    	@comment = @commentable.comments.build(comment_params)
    	@comment.user=current_user
      if @comment.save
         redirect_to :back,notice: 'Comment was successfully created.'
      else
        redirect_to :back, notice:'Comment could not be posted.Try again.'
      end
  end

  def destroy
  	@comment.destroy
    respond_to do |format|
      format.html { redirect_to :back }
    end
  end

  def show
  	
  end

  private

  def set_pin
    params.require(:comment).each do |name, value|
      if name =~ /(.+)_id$/
        @commentable = $1.classify.constantize.find(value)
      end
    end
 end

 def set_pin_destroy
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @commentable = $1.classify.constantize.find(value)
      end
    end
 end

 def set_comment
      @comment = @commentable.comments.find(params[:id])
      if @comment == nil
        redirect_to @commentable,notice:"comment does not exists"
      end
 end

 def comment_params
      params.require(:comment).permit(:content,:user_id,:commentable_id,:commentable_type)
 end
end

