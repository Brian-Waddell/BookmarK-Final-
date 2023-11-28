class DashboardController < ApplicationController 

  def index
    @q = Comment.ransack(params[:q])
    @results = @q.result.includes(:user_id, :commentable_id)
    
  end 
end 
