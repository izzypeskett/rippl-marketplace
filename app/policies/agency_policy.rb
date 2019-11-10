class AgencyPolicy < ApplicationPolicy
  def owned?
    record.user_id == user.id
  end

  def index?
    if record.listings.find(params[:id]) == nil
      redirect_to :root
    end
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