class Ability
  include CanCan::Ability

  def initialize(user)

    # Create a guest user if any (not logged in)
    user ||= User.new


    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    ##                Rights for ALL                  ##
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##

    ## MODEL : ITEM
    can :read, Item



    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    ##             Rights for REGISTERED              ##
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    if user.role

    end


    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    ##                Rights for ADMIN                ##
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    if user.is_admin

      ## MODEL : ITEM
      can :manage, Item

    end


  end
end
