class PerformancePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.try(:is_admin) || user.try(:super_admin?) || user.try(:agent?)
        scope.all
      elsif user.try(:venue?)
        scope.where(venue_id: user.venue_id)
      elsif user.try(:act?)
        scope.where(act_id: user.act_id)
      else
        scope.none
      end
    end
  end
end
