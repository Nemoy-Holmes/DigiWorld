class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. 
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    user ||= User.new #guest (not loggeg in)
    can :manage, User, id: user.id
  end
end
