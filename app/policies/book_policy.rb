class BookPolicy < ApplicationPolicy
  def destroy? 
    current_user == record.user
  end 
  def show?
    true
  end 
end
