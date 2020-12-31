class Ability
  include CanCan::Ability

  def initialize(user)  
    user ||= User.new
    if user.admin?
        can :manage, :all

        can :create, Herb
        can :read, Herb
        can :update, Herb
        can :destroy, Herb

        can :read, Contact
        can :destroy, Contact
    else
        can :create, Contact
        can :read, Contact, user_id: user.id
        can :destroy, Contact, user_id: user.id
        
        can :read, Herb
    end
  end
end