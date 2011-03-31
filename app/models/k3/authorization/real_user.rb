module K3
  module Authorization
    module RealUser
      def self.included(base)
        @@k3_permission_sets = Rails.application.railties.engines.
          collect {|e| e.class.authorization.default_suggested_permission_set}.
          compact
      end
      
      def k3_permissions
        @permissions = 
          if has_role? 'admin'
            @@k3_permission_sets.compact.inject([].to_set) {|result, permission_set| 
              result + permission_set.manager + permission_set.admin}
          else
            @@k3_permission_sets.compact.inject([].to_set) {|result, permission_set| 
              result + permission_set.guest + permission_set.user }
          end
      end

      def k3_permitted?(perm)
        k3_permissions.include?(perm)
      end
      
      def k3_guest?
        false
      end
    end
  end
end
