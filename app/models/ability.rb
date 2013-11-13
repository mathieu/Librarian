class Ability
  include CanCan::Ability

  def initialize(user)

    # Create a guest user if any (not logged in)
    user ||= User.new


    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    ##                Rights for ALL                  ##
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##

    ## MODEL : BOOK
    #can :read, Book



    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    ##             Rights for REGISTERED              ##
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    if user.role

    end


    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    ##                Rights for ADMIN                ##
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    if user.is_admin

      ## MODEL : BOOK
      #can :create, Book

    end


  end
end
