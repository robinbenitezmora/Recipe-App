class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, :all

    if user.role == 'admin'
      can :manage, :all
    else
      can :manage, Food
      can :read, Recipe, public: true
      can :manage, Recipe, user_id: user.id
      can :manage, Inventory, user_id: user.id
    end
  end
end
