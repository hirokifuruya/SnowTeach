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
      can :read, Request, user_id: user.id
      can :update, Request, user_id: user.id
      can :destroy, Request, user_id: user.id
    else
      cannot :manage, :all
    end
  end
end

