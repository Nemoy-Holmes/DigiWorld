class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. 
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
   if user ||= User.new #guest (not loggeg in)
    can :manage, User, id: user.id
    can :read, Product
    cannot :manage, Order
    if user.admin?
    	can :manage, :all
    end
    end
  end
end
