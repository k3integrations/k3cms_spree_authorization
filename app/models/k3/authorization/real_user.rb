module K3
  module Authorization
    module RealUser
      def self.included(base)
        auth_sets = Rails.application.railties.engines.collect {|e| e.class.authorization.default_suggested_permission_set}
        @@k3_real_perms = auth_sets.compact.inject([].to_set) {|result,set| result + set.user + set.manager + set.admin}
      end
      
      def k3_permitted?(perm)
        @@k3_real_perms.include?(perm)
      end
      
      def k3_permissions
        @@k3_real_perms
      end
      
      def k3_guest?
        false
      end
    end
  end
end
