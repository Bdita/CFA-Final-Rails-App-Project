class ImagePolicy < ApplicationPolicy
     attr_reader :user, :record

     def initialize(user, record)
       @user = user
       @record = record
     end

     def create?
          user.has_role? :ngo
     end

     def update?
          @record.user == user

     end

     def edit?
       @record.user == user
     end

     def destroy?
       @record.user == @user
     end
    end
