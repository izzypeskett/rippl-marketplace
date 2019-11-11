class ListingPolicy < ApplicationPolicy


  def owned?
      if user.is_agency? == true
      record.agency_id == user.agencies.first.id
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
    if owned?
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