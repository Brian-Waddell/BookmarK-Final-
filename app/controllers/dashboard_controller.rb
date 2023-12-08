class DashboardController < ApplicationController 

  def index
    
    @q = Comment.ransack(params[:q])
    @results = authorize @q.result.includes(:user_id, :commentable_id)

    @user = current_user
    @commented_book_count = @user.comments.distinct.count(:user_id)

    
  end 
end 
