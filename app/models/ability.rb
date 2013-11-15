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
    can :search, Item




    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    ##             Rights for REGISTERED              ##
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    if user.role

      ## MODEL : USER
      can :edit, User do |asked_user|
        user == asked_user
      end

      can :read, User do |asked_user|
        user == asked_user
      end
    end


    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    ##                Rights for ADMIN                ##
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    if user.is_admin

      ## MODEL : ITEM
      can :manage, Item

      ## MODEL : LOAN
      can :manage, Loan
    end


  end
end
