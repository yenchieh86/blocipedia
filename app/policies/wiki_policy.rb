class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.premium?
        scope.where(private: true, user_id: user.id) | scope.where(private: false) | user.wiki_collaborations
      else
        scope.where(private: false) | user.wiki_collaborations
      end
    end
  end
end
