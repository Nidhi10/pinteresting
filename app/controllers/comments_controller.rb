class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_pin
	before_action :set_comment ,only: [:destroy]

  def create
  	@comment = @pin.comments.build(comment_params)
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
  	@comments = @pin.comments.all
  end

  private

  def set_pin
      @pin = Pin.find(params[:pin_id])
      if @pin == nil
        redirect_to pins_path,notice:"Pin does not exists"
      end
 end

 def set_comment
      @comment = @pin.comments.find(params[:id])
      if @comment == nil
        redirect_to @pin,notice:"comment does not exists"
      end
 end

 def comment_params
      params.require(:comment).permit(:content,:user_id,:pin_id)
    end
end

