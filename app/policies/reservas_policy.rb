class ReservasPolicy < ApplicationPolicy
  def index?
    funcionario?
  end

  def show?
    funcionario?
  end

  def create?
    funcionario?
  end

  def update?
    funcionario?
  end

  def destroy?
    funcionario?
  end
end
