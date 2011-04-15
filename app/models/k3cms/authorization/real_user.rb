module K3cms
  module Authorization
    module RealUser
      def self.included(base)
        @@k3cms_permission_sets = Rails.application.railties.engines.
          collect {|e| e.class.authorization.default_suggested_permission_set}.
          compact
      end
      
      def k3cms_permissions
        @permissions = 
          if has_role? 'admin'
            @@k3cms_permission_sets.compact.inject([].to_set) {|result, permission_set| 
              result + permission_set.manager + permission_set.admin}
          else
            @@k3cms_permission_sets.compact.inject([].to_set) {|result, permission_set| 
              result + permission_set.guest + permission_set.user }
          end
      end

      def k3cms_permitted?(perm)
        k3cms_permissions.include?(perm)
      end
      
      def k3cms_guest?
        false
      end
    end
  end
end
