class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.employe?
      can :read, JobDetails
      #can [:update, :destroy], [JobDetails]
    else
      can :read, :all
    end
  end
end
