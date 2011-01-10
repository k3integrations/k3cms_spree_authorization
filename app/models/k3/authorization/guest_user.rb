module K3
  module Authorization
    class GuestUser
      def initialize
        auth_sets = Rails.application.railties.engines.collect {|e| e.class.authorization.default_suggested_permission_set}
        @guest_perms = auth_sets.compact.inject([].to_set) {|result,set| result + set.guest}
      end
      
      def k3_permitted?(perm)
        @guest_perms.include?(perm)
      end
      
      def k3_permissions
        @guest_perms
      end
      
      def k3_guest?
        true
      end
    end
  end
end
