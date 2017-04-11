class CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :edit, :update, :destroy]
  def index
    @comment = Comment.new
    
  end
  def new
      @comment = Comment.new
  end
  def create
    
    
   herald = Comment.new({:info_id => params[:info_id], :content => params[:content], :person_id => current_user.id})
   herald.save
 
  redirect_to :back
  
  
  end
  
  def destroy
    
   

    @delete.destroy
   redirect_to :back
  end
  private
  
  def find_post
   @hive_information = Info.find(params[:info_id])
  end
  
  
  def find_comment
   @delete = Comment.find(params[:id])
  end
  def comment_params
    params.require(:comment).permit(:content,:info_id, :person_id)
  
  
  end
end