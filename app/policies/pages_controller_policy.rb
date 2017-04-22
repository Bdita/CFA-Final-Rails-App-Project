class PagesControllerPolicy < ApplicationPolicy
     attr_reader :user, :ctrlr
  def initialize(user, ctrlr)
    @user = user
    @ctrlr = ctrlr
  end

  def admindashboard?
    user.has_role? :admin
  end

  def ngodashboard?
     user.has_role? :ngo
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
