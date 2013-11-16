class Ability
  include CanCan::Ability

  def initialize(user)

    # Create a guest user if any (not logged in)
    user ||= User.new

    # Create some aliases
    alias_action :create, :read, :update, :destroy, :to => :crud


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
      can :crud, Item

      ## MODEL : LOAN
      can :crud, Loan
      can :return, Loan do |loan|
        !loan.returned
      end

      ## Comic
      can :lend, Comic do |comic|
        comic.available
      end

      can :return, Comic do |comic|
        !comic.available
      end
    end


  end
end
