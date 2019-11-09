class AgencyPolicy < ApplicationPolicy
  def owned?
    record.user_id == user.id
  end

  def index?
    @agency.id == @listing.agency.id
  end

  def show?
    owned?
  end

  def create?
    owned?
  end

  def edit?
    owned?
  end

  def destroy?
    owned?
  end
end