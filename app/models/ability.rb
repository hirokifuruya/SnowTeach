# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    #binding.pry
    case user.role.name
    when "admin"
      #binding.pry
      can :access, :rails_admin
      can :manage, :all

    when "instructor"
      #binding.pry
      can :manage, :all
      cannot :access, :rails_admin

    when "general"
      can :read, :all
      cannot :access, :rails_admin

    else
      cannot :manage, :all
    end
  end
end
