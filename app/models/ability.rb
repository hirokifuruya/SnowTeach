
class Ability
  include CanCan::Ability

  def initialize(user)
    case user&.role&.name
    when "管理者"
      can :access, :rails_admin
      can :manage, :all
    when "インストラクター"
      can :manage, :all
      cannot :access, :rails_admin
    when "一般ユーザー"
      can :read, :all
      cannot :access, :rails_admin
      can :create, Request
      cannot :read, Request
      cannot :update, Request
      can :destroy, Request
    else
      can :read, :all
    end
  end
end
