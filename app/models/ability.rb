class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # guest user (not logged i
    can :read, :all
  end
end
