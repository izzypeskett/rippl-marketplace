class ListingPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if user.is_agency? == true || user.owner_of?(listing)
        scope.all
      else
        scope.where(published: true)
      end
    end
  end

 

  def create?
    user.is_agency? == true
  end

  def edit?
    if user.is_agency? == true || user.owner_of?(listing)
    else
      redirect_to :root 
    end
  end

  def update?
    user.is_agency? == true || user.owner_of?(listing) 
  end

  def destroy?
    user.is_agency? == true || user.owner_of?(listing)
  end

  def apply?
    user.is_agency == false
  end

end