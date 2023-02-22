# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    case user&.role&.name
    when "admin"
      can :access, :rails_admin
      can :manage, :all
    when "instructor"
      can :manage, :all
      cannot :access, :rails_admin
    when "general"
      can :read, :all
      cannot :access, :rails_admin
      can :create, Request
      cannot :read, Request
      cannot :update, Request
      cannot :destroy, Request
    else
      can :read, :all
    end
  end
end
