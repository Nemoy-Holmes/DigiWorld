class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. 
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
   user ||= User.new #guest (not loggeg in)
   can :manage, User, id: user.id

   if user.admin?
    can :manage, :all
  else
    can :read, :all
    can :manage, :User, id: user.id
    cannot :manage, :Product
    end
  end
end
