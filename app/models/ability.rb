class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.is_admin?
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
      return
    end
  end
end
