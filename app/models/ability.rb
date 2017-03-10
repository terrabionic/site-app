class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    if user
        #can :manage, :all
        if user.is? 'admin'

            can :manage, :all

        elsif user.is? 'company'

            can :read, Company do |company|
                company.user_login == user
            end
            can :update, Company do |company|
                company.user_login == user
            end

            can :update, User do |user_edit|
                user_edit == user
            end

            can :read, EventMonitor

        elsif user.is? 'consultant'

            can :read, Company

        elsif user.is? 'emprered'

            can :create, Company

            can :read, Company do |company|
                company.emprered == user
            end

            can :update, Company do |company|
                company.emprered == user
            end

            can :update, User do |user_edit|
                user_edit = user
            end

        elsif user.is? 'agente'

            can :read, Company do |company|
                company.agent == user
            end

            can :update, User do |user_edit|
                user_edit = user
            end

	       can :create, SurveyAnalysis	    
	       can :read, SurveyAnalysis 
            can :update, SurveyAnalysis
	    

        end
    end

  end
end
