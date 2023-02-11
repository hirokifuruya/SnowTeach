# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    #binding.pry
    if user.try(:admin?)
      binding.pry
      can :access, :rails_admin
      can :manage, :all

    elsif user.try(:instructor?)
      #binding.pry
      can :manage, :all
      cannot :access, :rails_admin

    elsif user.try(:general?)
      can :read, :all
      cannot :access, :rails_admin

    else
      can :manage, :all
      can :access, :rails_admin
    end
  end
end
