class ImagePolicy < ApplicationPolicy
     attr_reader :user, :record

     def initialize(user, record)
       @user = user
       @record = record
     end

     def show?
          user.has_role? :admin || @record.user == @user
     end

     def update?
          user.has_role? :admin || @record.user == user
     end

     def edit?
       user.has_role? :admin || record == user
     end

     def destroy?
       user.has_role? :admin || @record.user == @user
     end

  class Scope < Scope
     def resolve
           scope
     end
  end
end
