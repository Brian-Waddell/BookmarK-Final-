class FollowsPolicy < ApplicationPolicy
  
  def index?
    true 
  end

  def show?
    true
  end

  def create?
    true
  end

  
  def update?
    owner?
  end

  def destroy?
    owner? 
  end

  private 

  def owner? 
    record.user == @user.id
  end 
end
