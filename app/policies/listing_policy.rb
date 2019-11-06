class ListingPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if user.is_agency? == true || user.owner_of?(record)
        scope.all
      else
        scope.where(published: true)
      end
    end
  end

  def owned?
      if user.is_agency? == true
      record.agency_id == agency.id
      else
      end
  end

  def new?
    user.is_agency == true
  end

 

  def create?
    user.is_agency? == true
  end

  def edit?
    if user.is_agency? == true || owned?
    else
      redirect_to :root 
    end
  end

  def update?
    user.is_agency? == true || owned?
  end

  def destroy?
    user.is_agency? == true || owned?
  end

  def apply?
    user.is_agency == false
  end

end